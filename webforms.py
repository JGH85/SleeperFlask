from flask_wtf import FlaskForm
from flask_wtf.file import FileField
from wtforms import StringField, SubmitField, PasswordField, BooleanField, ValidationError
from wtforms.validators import DataRequired, EqualTo, Length
from wtforms.widgets import TextArea
from flask_ckeditor import CKEditorField


#Form for Blog Posts
class PostForm(FlaskForm):
    title = StringField("Title", validators=[DataRequired()])
    # content = StringField("Content", validators=[DataRequired()], widget=TextArea())
    content = CKEditorField('Content', validators=[DataRequired()])
    # author = StringField("Author")
    slug = StringField("Slug", validators=[DataRequired()])
    submit = SubmitField("Submit")

class PasswordForm(FlaskForm):
    email = StringField("Email", validators=[DataRequired()])
    password_hash = PasswordField("Password", validators=[DataRequired()])
    submit = SubmitField("Submit")

class UserForm(FlaskForm):
    name = StringField("Name", validators=[DataRequired()])
    username = StringField("Username", validators=[DataRequired()])
    email = StringField("Email", validators=[DataRequired()])
    teamname = StringField("Teamname")
    password_hash = PasswordField('Password', validators = [DataRequired(), EqualTo('password_hash2', "Passwords must match.")])
    password_hash2 = PasswordField('Confirm Password', validators = [DataRequired()])
    profile_pic = FileField("Profile Pic")
    submit = SubmitField("Submit")


class LoginForm(FlaskForm):
	username = StringField("Username", validators=[DataRequired()])
	password = PasswordField("Password", validators=[DataRequired()])
	submit = SubmitField("Submit")

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

class SearchForm(FlaskForm):
    searched = StringField("searched", validators=[DataRequired()])
    submit = SubmitField("Submit")