# Satement of enabling development feature to debug application.
DEBUG = True

# Database - mysql
SQLALCHEMY_DATABASE_URI = 'mysql://rohit:password@localhost/flask'

# Auto detecting of any changes.
SQLALCHEMY_TRACK_MODIFICATIONS = True

# Secret key for loggin cookies.
SECRET_KEY = 'Dont_tell_Anyone_Keep_it_secret'

# Path for image storing.
UPLOAD_FOLDER = 'static/img/'

# Statement of cookie duration.
import datetime
REMEMBER_COOKIE_DURATION = datetime.timedelta(30)

# Cookie domain name.
REMEMBER_COOKIE_DOMAIN = 'dev.localhost.com'