from flask_login import UserMixin
import datetime
from flask_wtf import FlaskForm, RecaptchaField
from wtforms import StringField, BooleanField, PasswordField
from wtforms.validators import input_required, Length, Email


date = datetime.datetime.strftime(datetime.datetime.now(), '%B %d, %Y')

from app import db

class Contacts(db.Model):
    __tablename__ = 'contacts'
    id = db.Column('No', db.Integer, primary_key=True)
    name = db.Column('Name', db.String(50), nullable=False)
    email = db.Column('Email', db.String(50), nullable=False)
    phone = db.Column('Phone', db.VARCHAR(15), nullable=False)
    message = db.Column('Message', db.Text, nullable=False)
    date = db.Column('Date', db.VARCHAR(20), default=date)

    def __repr__(self):
        return '<Contacts(Name=%s, Email=%s, Phone=%s, Message=%s, Date=%s)>' % (
            self.name, self.email, self.phone, self.message, self.date)


class Post(db.Model):
    __tablename__ = 'post'
    id = db.Column('No', db.Integer, primary_key=True)
    title = db.Column('Title', db.Text, nullable=False)
    body = db.Column('Body', db.Text, nullable=False)
    tag = db.Column('Tag', db.Text, nullable=False)
    like = db.Column('Like', db.Text, default=0)
    url = db.Column('Url', db.Text, nullable=False)
    date = db.Column('Date', db.String(20), nullable=False, default=date)

    def __repr__(self):
        return '<Post(title=%s, body=%s, tag=%s, like=%s, url=%s date=%s)>' % (self.title, self.body, self.tag, self.like, self.url, self.date)


class Login(db.Model, UserMixin):
    __tablename__ = 'login'
    id = db.Column('No', db.Integer, primary_key=True)
    username = db.Column('Username', db.String(50), nullable=False)
    email = db.Column('Email', db.String(100), nullable=False)
    password = db.Column('Password', db.String(200), nullable=False)
    date = db.Column('Date', db.String(20), nullable=False, default=date)

    def get_id(self):
        return self.id
    @property
    def is_authenticated(self):
        return True
    @property
    def is_active(self):
        return True
    @property
    def is_anonymous(self):
        return False
    @property
    def __repr__(self):
        return '<Login(username=%s, email=%s, password=%s, date=%s)>' % (self.name, self.email, self.password, self.date)

class Login_form(FlaskForm):
    email = StringField('Email *', validators=[input_required('Email is required!')])
    password = PasswordField('Password *', validators=[input_required('Password is required!'), Length(min=6, max=12)])
    remember = BooleanField('Remember me')

class Signup_form(FlaskForm):
    username = StringField('Username *', validators=[input_required('Username is required!'), Length(min=3, max=12)])
    email = StringField('Email *', validators=[input_required('Email is required!'), Email('Invalid email*')])
    password = PasswordField('Password *', validators=[input_required('Password is required!'), Length(min=6, max=12)])