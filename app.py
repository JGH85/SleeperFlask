import requests
# from xml.etree.ElementTree import Comment
from flask import Flask, render_template, request, redirect, url_for, flash
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, PasswordField, BooleanField, ValidationError
from wtforms.validators import DataRequired, EqualTo, Length
from wtforms.widgets import TextArea
from datetime import datetime 
from werkzeug.security import generate_password_hash, check_password_hash
import json

from config import DBName, DBPassword, DBUsername, FormKey
import pandas as pd

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///testsleeper.db'
app.config['SECRET_KEY'] = "super secret key"


# app.config['SQLALCHEMY_DATABASE_URI'] = f'mysql://{DBUsername}:{DBPassword}@localhost/{DBName}'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# app.config['SECRET_KEY'] = FormKey

#initialize the database
db = SQLAlchemy(app)
migrate = Migrate(app, db)

class Users(db.Model):
	id = db.Column(db.Integer, primary_key=True)
	# username = db.Column(db.String(20), nullable=False, unique=True)
	name = db.Column(db.String(200), nullable=False)
	email = db.Column(db.String(120), nullable=False, unique=True)
	teamname = db.Column(db.String(40))
	# about_author = db.Column(db.Text(), nullable=True)
	date_added = db.Column(db.DateTime, default=datetime.utcnow)
	# profile_pic = db.Column(db.String(), nullable=True)

	# Do some password stuff!
	password_hash = db.Column(db.String(128))

	# Create A String
	def __repr__(self):
		return '<Name %r>' % self.name

	@property
	def password(self):
		raise AttributeError('password is not a readable attribute!')

	@password.setter
	def password(self, password):
		self.password_hash = generate_password_hash(password)

	def verify_password(self, password):
		return check_password_hash(self.password_hash, password)




# class Users(db.Model, UserMixin):
# 	id = db.Column(db.Integer, primary_key=True)
# 	username = db.Column(db.String(20), nullable=False, unique=True)
# 	name = db.Column(db.String(200), nullable=False)
# 	email = db.Column(db.String(120), nullable=False, unique=True)
# 	favorite_color = db.Column(db.String(120))
# 	about_author = db.Column(db.Text(), nullable=True)
# 	date_added = db.Column(db.DateTime, default=datetime.utcnow)
# 	profile_pic = db.Column(db.String(), nullable=True)

# 	# Do some password stuff!
# 	password_hash = db.Column(db.String(128))
# 	# User Can Have Many Posts 
# 	posts = db.relationship('Posts', backref='poster')


# 	@property
# 	def password(self):
# 		raise AttributeError('password is not a readable attribute!')

# 	@password.setter
# 	def password(self, password):
# 		self.password_hash = generate_password_hash(password)

# 	def verify_password(self, password):
# 		return check_password_hash(self.password_hash, password)


class Posts(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    title = db.Column(db.String(255))
    content = db.Column(db.Text)
    author = db.Column(db.String(255))
    date_posted = db.Column(db.DateTime, default=datetime.utcnow)
    slug = db.Column(db.String(255))

class PostForm(FlaskForm):
    title = StringField("Title", validators=[DataRequired()])
    content = StringField("Content", validators=[DataRequired()], widget=TextArea())
	# content = CKEditorField('Content', validators=[DataRequired()])
    author = StringField("Author")
    slug = StringField("Slug", validators=[DataRequired()])
    submit = SubmitField("Submit")

class Player(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    full_name = db.Column(db.String(20), nullable=False)
    last_name = db.Column(db.String(20))
    first_name = db.Column(db.String(20))
    search_full_name = db.Column(db.String(40))
    search_last_name = db.Column(db.String(20))
    search_first_name = db.Column(db.String(20))
    position = db.Column(db.String(20))
    # rosters = db.relationship('Roster', backref='player', lazy=True)
    # date_added
    # date_updated
    
class Team(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    team_name = db.Column(db.String(60))
    owner_id = db.Column(db.Integer)

    # last_name = db.Column(db.String(20))
    # first_name = db.Column(db.String(20))
    # search_full_name = db.Column(db.String(40))
    # search_last_name = db.Column(db.String(20))
    # search_first_name = db.Column(db.String(20))
    # position = db.Column(db.String(20))

class Roster(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    team_id = db.Column(db.Integer)
    # player_id = db.Column(db.Integer, db.ForeignKey('player.id'), nullable=False)
    season = db.Column(db.Integer)
    salary = db.Column(db.Numeric)
    is_Franchised = db.Column(db.Boolean)
    date_added = db.Column(db.DateTime)
    date_removed = db.Column(db.DateTime)
    date_updated = db.Column(db.DateTime)

class CapHold(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    team_id = db.Column(db.Integer)
    player_id = db.Column(db.Integer)
    season = db.Column(db.Integer)
    caphold = db.Column(db.Numeric)
    reason = db.Column(db.String(20))
    note = db.Column(db.String(200))
    effective_date = db.Column(db.DateTime) #date that the transaction occurred
    date_updated = db.Column(db.DateTime) #date that the transaction got added to DB

class TransactionFA(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    transaction_type = db.Column(db.String(20))
    roster_id = db.Column(db.Integer)
    dropped_player_id = db.Column(db.Integer)
    added_player_id = db.Column(db.Integer)
    added_salary = db.Column(db.Numeric)
    status_updated = db.Column(db.Integer)
    transaction_date = db.Column(db.DateTime)

# this class tracks when last data pulls occurred
class DataUpdateLog(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    lastPlayerUpdateDate = db.Column(db.Date)
    lastNFLStateUpdateDate = db.Column(db.Date)
    lastOwnerUpdateDate = db.Column(db.Date)
    lastRosterUpdateDate = db.Column(db.Date)
    lastTransactionUpdateDate = db.Column(db.Date)

#a transaction which is a trade gets stored as multiple rows, 1 or more per team depending on number of players in trade
class TradeTransaction(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    transaction_id = db.Column(db.Integer) #there can be multiple rows per trade
    roster_id = db.Column(db.Integer)
    dropped_player_id = db.Column(db.Integer)
    added_player_id = db.Column(db.Integer)
    status_updated = db.Column(db.Integer)
    transaction_date = db.Column(db.DateTime)
    




class Comments(db.Model):
    id = db.Column(db.Integer, primary_key = True)
    name = db.Column(db.String(20))
    comment = db.Column(db.String(1000))

#Create Form Class
class NamerForm(FlaskForm):
    name = StringField("Email", validators=[DataRequired()])
    submit = SubmitField("Submit")

class PasswordForm(FlaskForm):
    email = StringField("Email", validators=[DataRequired()])
    password_hash = PasswordField("Password", validators=[DataRequired()])
    submit = SubmitField("Submit")

class UserForm(FlaskForm):
    name = StringField("Name", validators=[DataRequired()])
    email = StringField("Email", validators=[DataRequired()])
    teamname = StringField("Teamname")
    password_hash = PasswordField('Password', validators = [DataRequired(), EqualTo('password_hash2', "Passwords must match.")])
    password_hash2 = PasswordField('Confirm Password', validators = [DataRequired()])
    submit = SubmitField("Submit")


#Create Form Classes
class PlayerForm(FlaskForm):
    playername = StringField("playername")
    salary = StringField("Salary", validators=[DataRequired()])
    teamname = StringField("Team Name")
    submit = SubmitField("Submit")

class PlayerRosterForm(FlaskForm):
    playername = StringField("playername")
    salary = StringField("Salary", validators=[DataRequired()])
    teamname = StringField("Team Id")
    submit = SubmitField("Submit")


UserId = "499807936168587264"
Sport = "nfl"
LeagueId = "859990766557179904"
#setup urls for API calls
user_url = f'https://api.sleeper.app/v1/user/{UserId}'
league_users_url = f'https://api.sleeper.app/v1/league/{LeagueId}/users'
# transactions_url = f'https://api.sleeper.app/v1/league/{LeagueId}/transactions/{Week}'
# rosters_url = f'https://api.sleeper.app/v1/league/{LeagueId}/rosters'
# players_url = 'https://api.sleeper.app/v1/players/nfl'



@app.route('/user/update/<int:id>', methods = ['GET', 'POST'])
def update_user(id):
    form = UserForm()
    name_to_update = Users.query.get_or_404(id)
    if request.method == "POST":
        name_to_update.name = request.form['name']
        name_to_update.email = request.form['email']
        name_to_update.teamname = request.form['teamname']
        # name_to_update.username = request.form['username']
        try:
            db.session.commit()
            flash("User Updated Successfully!")
            return render_template("update_user.html", 
				form=form,
				name_to_update = name_to_update, id=id)
        except:
            flash("Error!  Looks like there was a problem...try again!")
            return render_template("update_user.html", 
				form=form,
				name_to_update = name_to_update,
				id=id)
    else:
        return render_template("update_user.html", 
				form=form,
				name_to_update = name_to_update,
				id = id)



@app.route('/user/add', methods = ['GET', 'POST'])
def add_user():
	name = None
	form = UserForm()
	if form.validate_on_submit():
		user = Users.query.filter_by(email=form.email.data).first()
		if user is None:
			## Hash the password!!!
			hashed_pw = generate_password_hash(form.password_hash.data, "sha256")
			user = Users(name=form.name.data, email=form.email.data, teamname = form.teamname.data, password_hash = hashed_pw)
			db.session.add(user)
			db.session.commit()
		name = form.name.data
		form.name.data = ''
		# form.username.data = ''
		form.email.data = ''
		form.teamname.data = ''
		form.password_hash.data = ''

		flash("User Added Successfully!")
	our_users = Users.query.order_by(Users.date_added)
	return render_template("add_user.html", 
		form=form,
		name=name,
		our_users=our_users)

@app.route('/user/delete/<int:id>')
# @login_required
def delete_user(id):
	# Check logged in id vs. id to delete
	# if id == current_user.id:
	user_to_delete = Users.query.get_or_404(id)
	name = None
	form = UserForm()

	try:
		db.session.delete(user_to_delete)
		db.session.commit()
		flash("User Deleted Successfully!!")

		our_users = Users.query.order_by(Users.date_added)
		return render_template("add_user.html", 
		form=form,
		name=name,
		our_users=our_users)

	except:
		flash("Whoops! There was a problem deleting user, try again...")
		return render_template("add_user.html", 
		form=form, name=name,our_users=our_users)
	# else:
		# flash("Sorry, you can't delete that user! ")
		# return redirect(url_for('dashboard'))




# add code to call sleeper API
@app.route('/owners')
def getOwners():
    response = requests.get(league_users_url)
    league = response.json()
    league_df = pd.DataFrame(league)

    #convert metadata column to separate columns
    league_metadata = pd.json_normalize(league_df['metadata'])

    #concatenate metadata columns to league data
    league_df = pd.concat([league_df, league_metadata], axis=1)

    #fill team name based on username if missing
    league_df['team_name'] = league_df['team_name'].fillna(league_df['display_name'])

    league = league_df.to_html()
        
    return render_template('owners.html', league=league)

@app.route('/update/<int:id>', methods = ['GET', 'POST'])
def updatePlayer(id):
    form = PlayerForm()
    player_to_update = Player.query.get_or_404(id)
    if request.method == "POST":
        player_to_update.fullname = request.form['name']
        try:
            db.session.commit()
            flash("Player updated successfully.")
            return render_template('update.html', form=form, player_to_update = player_to_update)
        except:
            flash("Oops, that didn't work.")
            return render_template('update.html', form=form, player_to_update = player_to_update)
    else:
        return render_template('update.html', form=form, player_to_update = player_to_update)

@app.route('/players/load')
def getPlayers():
    players_url = 'https://api.sleeper.app/v1/players/nfl'
    response = requests.get(players_url)
    players = response.json()
    
    player_id_list = list(players.keys())
    position_list = ['QB', 'WR', 'RB', 'TE', 'K']
    added_player_count = 0
    for id in player_id_list:     
        if players[id]['position'] in position_list and added_player_count < 15000:
            player_to_update = Player.query.filter_by(id=id).first()
            if player_to_update == None:
                p = Player()
                p.id = players[id]['player_id']
                p.search_full_name = players[id]['search_full_name']
                p.search_last_name = players[id]['search_last_name']
                p.search_last_name = players[id]['search_first_name']
                p.full_name = players[id]['full_name']
                p.last_name = players[id]['last_name']
                p.first_name = players[id]['first_name']
                p.position = players[id]['position']
                db.session.add(p)
                db.session.commit()
                added_player_count += 1
                print(f'added player {p.full_name} with id {p.id}.')
            else: print(f'player {players[id]["full_name"]} already exists, no changes made.')
    flash(f"successfully added {added_player_count} players")

        
    return render_template('load_players.html')


@app.route('/players/editsalary', methods=['GET', 'POST'])
def editSalary():
    form = PlayerRosterForm()
    if form.validate_on_submit():
        # we actually need to check the roster here
        matches = Player.query.filter_by(full_name = form.playername.data).count()
        if matches == 1:
            flash("unique match found.")
            myplayer = Player.query.filter_by(full_name = form.playername.data).first()
            roster_to_update = Roster.query.filter_by(player_id = myplayer.id).first()
            if roster_to_update == None:
                roster_to_add = Roster()
                roster_to_add.player_id = myplayer.id
                roster_to_add.salary = form.salary.data
                roster_to_add.team_id = 10
                # roster_to_add.team_id = form. calculate team id based on name
                # player_to_update.full_name = form.playername.data
                db.session.add(roster_to_add)
                db.session.commit()
                flash("player added")
                print(f"added player {form.playername.data} to roster {roster_to_add.team_id} with salary {roster_to_add.salary}")

        else:
            flash("No unique match found")
    playername = form.playername.data
    form.playername.data = ''    
    our_players = Player.query.order_by(Player.id)                   

    return render_template("edit_salary.html", form=form, playername = playername, our_players = our_players)

# add code to call sleeper API
@app.route('/nflstate')
def getNFLState():
    nfl_state_url = f'https://api.sleeper.app/v1/state/{Sport}'
    nfl_state = requests.get(nfl_state_url).json()
    week = nfl_state['week']
    season = nfl_state['season']
    
    return render_template('nflstate.html', week=week, season=season)


# simple api route to return basic player info by ID
@app.route('/player/info/<int:id>')
def get_player_info(id):
    player_to_find = Player.query.filter_by(id=id).first()
    mydict = {
        "Name": player_to_find.full_name,
        "Position": player_to_find.position, 
        "PlayerId": player_to_find.id
    }
    # for attribute, value in player_to_find.__dict__.items():
    #     mydict[attribute] = value
    # print(mydict)
    # return player_to_find.full_name
    return mydict

# simple api route to return basic player info by ID
@app.route('/player/info/limit/<int:limit>')
def get_player_info_limit(limit):
    players_to_find = Player.query.limit(limit)
    my_dict = {}
    for player in players_to_find:
        player_dict = {
            "Name": player.full_name,
            "Position": player.position, 
            "PlayerId": player.id
        }
        my_dict[player.id] = player_dict
    return my_dict







@app.route('/')
def index():
    # flash('Welcome to the League Page!')
    # result = Comments.query.all()
    return render_template('index.html')


# @app.route('/sign')
# def sign_book():
#     return render_template('sign.html') 

# @app.route('/process_sign', methods=['Post'])
# def process_sign():
#     name = request.form['name']
#     comment = request.form['comment']

#     signature = Comments(name=name, comment=comment)
#     db.session.add(signature)
#     db.session.commit()
    
#     return redirect(url_for('index'))

# @app.route('/home', methods=['GET', 'POST'])
# def home():
#     links = [("YouTube","https://www.youtube.com"), ("Bing","https://www.bing.com"), ("DailyWire","https://www.dailywire.com")]
#     return render_template('example.html', myvar = 'Rum Raisin', tuples = links)
#     # return render_template('example.html')


# @app.route('/home/<place>')
# def place(place):
#     return f'<h1>You are on the {place} page!<h1>'


# #create Name Page
# @app.route('/name', methods=['GET', 'POST'])
# def name():
#     name = None
#     form = NamerForm()
#     #validate
#     if form.validate_on_submit():
#         name = form.name.data
#         form.name.data = ""         
#         flash("Form submitted successfully.")
#     return render_template('name.html', 
#     name=name, 
#     form=form)

#create test pw Page
@app.route('/test_pw', methods=['GET', 'POST'])
def test_pw():
    email = None
    password = None
    pw_to_check = None
    passed = None


    form = PasswordForm()
    #validate
    if form.validate_on_submit():
        email = form.email.data
        password = form.password_hash.data

        pw_to_check = Users.query.filter_by(email=email).first()
        passed = check_password_hash(pw_to_check.password_hash, password)
        
        form.email.data = ""         
        form.password_hash.data = ""         

        flash("Form submitted successfully.")
    return render_template(
        'test_pw.html', 
        email=email, 
        password = password, 
        pw_to_check = pw_to_check,
        passed = passed,
        form=form)

# Add Post Page
@app.route('/add-post', methods=['GET', 'POST'])
#@login_required
def add_post():
	form = PostForm()

	if form.validate_on_submit():
		# poster = current_user.id
		# post = Posts(title=form.title.data, content=form.content.data, poster_id=poster, slug=form.slug.data)
		post = Posts(title=form.title.data, content=form.content.data, author = form.author.data, slug=form.slug.data)

        # Clear The Form
		form.title.data = ''
		form.content.data = ''
		form.author.data = ''
		form.slug.data = ''

		# Add post data to database
		db.session.add(post)
		db.session.commit()

		# Return a Message
		flash("Blog Post Submitted Successfully!")

	# Redirect to the webpage
	return render_template("add_post.html", form=form)

@app.route('/posts')
def posts():
	posts = Posts.query.order_by(Posts.date_posted)
	return render_template("posts.html", posts=posts)

@app.route('/post/<int:id>')
def post(id):
	post = Posts.query.get_or_404(id)
	return render_template("post.html", post=post)


@app.route('/posts/edit/<int:id>', methods=['GET', 'POST'])
def edit_post(id):
    post = Posts.query.get_or_404(id)
    form = PostForm()
    if form.validate_on_submit():
            post.title = form.title.data
            post.author = form.author.data
            post.slug = form.slug.data
            post.content = form.content.data
            # Update Database
            db.session.add(post)
            db.session.commit()
            flash("Post Has Been Updated!")
            return redirect(url_for('post', id=post.id))
    form.title.data = post.title
    form.author.data = post.author
    form.slug.data = post.slug
    form.content.data = post.content
    return render_template('edit_post.html', form=form)


@app.route('/posts/delete/<int:id>', methods=['GET', 'POST'])
def delete_post(id):
    post = Posts.query.get_or_404(id)
    try:
        db.session.delete(post)
        db.session.commit()
        flash("Post successfully deleted.")
        return redirect(url_for('posts'))
    except:
        flash("Deletion failed.")
        return redirect(url_for('posts'))


    # form = PostForm()
    # if form.validate_on_submit():
    #         post.title = form.title.data
    #         post.author = form.author.data
    #         post.slug = form.slug.data
    #         post.content = form.content.data
    #         # Update Database
    #         db.session.add(post)
    #         db.session.commit()
    #         flash("Post Has Been Updated!")
    #         return redirect(url_for('post', id=post.id))
    # form.title.data = post.title
    # form.author.data = post.author
    # form.slug.data = post.slug
    # form.content.data = post.content
    return render_template('edit_post.html', form=form)


if __name__ == '__main__':
    app.run(debug=True)


#features to add in future:
#store teamname with players 
# update classes to use relationships
#add custom 404 page