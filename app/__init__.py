from flask import Flask, url_for, redirect, render_template


app = Flask(__name__)
app.config.from_pyfile('config.py')

from flask_sqlalchemy import SQLAlchemy
db = SQLAlchemy(app)


from flask_login import LoginManager

login_manager = LoginManager(app)

login_manager.init_app(app)
login_manager.session_protection = 'strong'

# --------------------------- Start error handler ---------------------------#
@login_manager.unauthorized_handler
def unauthorized():
    return redirect(url_for('user.login'))
# ------------------------ End unauthorized handler -------------------------#

@app.errorhandler(404)
def not_found(error):
    return render_template('404.html')


from app.user.views import user
app.register_blueprint(user)

from app.admin.views import admin
app.register_blueprint(admin, url_prefix="/admin")