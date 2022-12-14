from flask_wtf import FlaskForm
from flask_wtf.file import FileField
from wtforms import StringField, SubmitField, PasswordField, BooleanField, ValidationError
from wtforms.validators import DataRequired, EqualTo, Length, Email, ValidationError
from wtforms.widgets import TextArea
from flask_ckeditor import CKEditorField
# from app import Users


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
        # email = StringField("Email", validators=[DataRequired(), Email()])
    password_hash = PasswordField("Password", validators=[DataRequired()])
    submit = SubmitField("Submit")

class UserForm(FlaskForm):
    name = StringField("Name", validators=[DataRequired()])
    username = StringField("Username", validators=[DataRequired(), Length(min=2, max=20)])
    email = StringField("Email", validators=[DataRequired()])
        # email = StringField("Email", validators=[DataRequired(), Email()])

    teamname = StringField("Teamname")
    password_hash = PasswordField('Password', validators = [DataRequired(), EqualTo('password_hash2', "Passwords must match.")])
    password_hash2 = PasswordField('Confirm Password', validators = [DataRequired()])
    profile_pic = FileField("Profile Pic")
    submit = SubmitField("Submit")

    # def validate_username(self, username):
    #     user = Users.query.filter_by(username=username.data).first()
    #     if user:
    #         raise ValidationError('That username is taken. Please choose a different one.')

    # def validate_email(self, email):
    #     user = Users.query.filter_by(email=email.data).first()
    #     if user:
    #         raise ValidationError('That email is taken. Please choose a different one.')


class LoginForm(FlaskForm):
	username = StringField("Username", validators=[DataRequired()])
	password = PasswordField("Password", validators=[DataRequired()])
	submit = SubmitField("Submit")

class ForgotPasswordForm(FlaskForm):
    # email = StringField("Please provide your email to receive a reset password link:", validators=[DataRequired(), Email()])
    email = StringField("Please provide your email to receive a reset password link:", validators=[DataRequired()])

    submit = SubmitField("Submit")

    def validate_email(self, email):
        user = Users.query.filter_by(email=email.data).first()
        if user is None:
            raise ValidationError('There is no account with that email. You must register first.')

class ResetPasswordForm(FlaskForm):
    password_hash = PasswordField('Password', validators = [DataRequired(), EqualTo('password_hash2', "Passwords must match.")])
    password_hash2 = PasswordField('Confirm Password', validators = [DataRequired()])
    submit = SubmitField('Reset Password')

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