from flask import Blueprint

user = Blueprint(
    'user',
    __name__,
    template_folder='user_template',
    static_folder='static',
)