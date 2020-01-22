from app.model import (Post, Login_form, Login, Signup_form, Contacts)
from flask import render_template, redirect, url_for, flash, request, jsonify
from werkzeug.security import generate_password_hash, check_password_hash
from werkzeug.utils import secure_filename
from werkzeug.security import generate_password_hash, check_password_hash
from sqlalchemy import desc
from flask_login import login_required, login_user, logout_user
from app import db, login_manager
from app.user import user
import random, re


ALLOW_EXTENSIONS = {'jpg', 'png', 'txt', 'jpeg', 'gif', 'pdf'}


@login_manager.user_loader
def user_loader(user_id):
    return Login.query.get(user_id)


# ----------------------------- "Home page" ------------------------------------------#
@user.route('/')
def index():
    # ---------------- For 'Image carousel' div ----------#
    post = db.session.query(Post).order_by(Post.id.desc()).all()[:5]

    # ---------------- For 'trend' div -------------------#
    trending = db.session.query(Post).order_by(Post.like).all()[0:6]
    trending = [trending[p] for p in range(len(trending)-1, 0, -1)]

    # ---------------- For 'money' div -------------------#
    tmp_money = db.session.query(Post).all()[::-1]
    money = [n for n in tmp_money[:5] if [
        True for tag in n.tag.split(',') if 'money' in tag.strip().lower()]]

    # ---------------- For 'bussiness' div ---------------#
    tmp_business = db.session.query(Post).all()[::-1]
    business = [n for n in tmp_business[:5] if [
        True for tag in n.tag.split(',') if 'business' in tag.strip().lower()]]

    # ---------------- For 'investment' div --------------#
    tmp_investment = db.session.query(Post).all()[::-1]
    investment = [n for n in tmp_investment[:10] if [
        True for tag in n.tag.split(',') if 'investment' in tag.strip().lower()]]

    # ---------------- For 'Today' div -------------------#
    today = [post[d]
             for d in range(len(post)-1, 0, -1)][:(len(investment)//2)+2]

    return render_template('index.html', one=[post[0]], two=[post[1]], three=[post[2]], four=[post[3]], five=[post[4]],
                           trending=trending, money=money, business=business, investment=investment, today=today)


@user.route('/about')
def about():
    return render_template('about.html')



@user.route('/contact')
@login_required
def contact():
    return render_template('contact.html')


@user.route('/public/post', methods=['GET', 'POST'])
@login_required
def new_post():
    if request.method == 'POST':
        title = request.form['title']
        body = request.form['body']
        tag = request.form['tag']
        file = request.files['file']

        if len(body) >= 200:
            if [True for t in tag.split(',') if ('investment' in t.lower().strip()) or ('business' in t.lower().strip()) or ('life' in t.lower().strip()) or ('money' in t.lower().strip())]:
                if file.filename != "" and [True for file_s in file.filename.split('.') if file_s.isalnum()]:
                    # checking file extension
                    def check_file(file__):
                        return '.' in file__ and file__.rsplit('.', 1)[1].lower() in ALLOW_EXTENSIONS

                    if check_file(file.filename):
                        file_name = os.path.join(
                            app.config['UPLOAD_FOLDER'], file.filename)
                        file.save(file_name)

                        post = Post(title=title, body=body, tag=tag, url=file_name, date=date)
                        db.session.add(post)
                        db.session.commit()
                        flash('Successfully posted!', 'success')
                        return redirect(url_for('user.index'))

                    else:
                        flash('This file isn\'t secure!', 'danger')
                        return redirect(url_for('new_post'))
                else:
                    flash('No file selected!', 'danger')
                    return redirect(url_for('new_post'))
            else:
                flash('Ours platform is based on four catageory,  (i.e. investment, money, life, business).', 'danger')
                return redirect(url_for('user.new_post'))
        else:
            flash('Body length should be greater than two thousand!', 'danger')
            return redirect(url_for('user.new_post'))
    else:
        return render_template('add_post.html')


# ------------------- route system -----------------------#
@user.route('/post/<int:no>')
@login_required
def post_direction(no):
    post = db.session.query(Post).all()
    one_post = db.session.query(Post).filter_by(id=no).all()

    # ---------------- For 'money' div -------------------#
    tmp_money = db.session.query(Post).all()[::-1]
    money = [n for n in tmp_money[:5] if [
        True for tag in n.tag.split(',') if 'money' in tag.strip().lower()]]

    # ---------------- For 'business' div ---------------#
    tmp_business = db.session.query(Post).all()[::-1]
    business = [n for n in tmp_business[:5] if [
        True for tag in n.tag.split(',') if 'business' in tag.strip().lower()]]

    # ---------------- For 'investment' div --------------#
    tmp_investment = db.session.query(Post).all()[::-1]
    investment = [n for n in tmp_investment[:10] if [
        True for tag in n.tag.split(',') if 'investment' in tag.strip().lower()]]

    # ---------------- For 'Today' div -------------------#
    today = [post[d] for d in range(len(post)-1, 0, -1)][:len(investment)//2]

    # ---------------- For "Related" div -----------------#
    related = [n for n in tmp_investment[:10] if [True for tag in n.tag.split(',') if 'investment' in tag.strip(
    ).lower() or 'money' in tag.strip().lower() or 'business' in tag.strip().lower()]]

    return render_template('post.html', one_post=one_post, related=related, money=money, business=business, investment=investment, today=today)



@user.route('/user/signup', methods=["POST", "GET"])
def signup():
    signup_form = Signup_form()

    if signup_form.validate_on_submit():
        if signup_form.username.data.isalnum():
            new_email = re.match(r'^[a-zA-Z0-9]+\@[a-z]+\.com$', signup_form.email.data).group(0)
            new_password = re.match(r'\w+[!@#$%&]{0,4}', signup_form.password.data).group(0)

            if new_email and new_password:
                new_user = Login(username=str(signup_form.username.data), email = new_email, password=str(generate_password_hash(new_password)))
                db.session.add(new_user)
                db.session.commit()
                login_user(new_user)
                return redirect(url_for('user.index'))
            else:
                flash('Please, give the right input!', 'danger')
                return redirect(url_for('user.signup', signup_form=signup_form))
        else:
            flash('Please, give the right username!', 'danger')
            return redirect(url_for('user.signup', signup_form=signup_form))
    else:
        return render_template('signup.html', signup_form=signup_form)

# --------------------------- Start 'home' page category -----------------------#


# ------------------- login route --------------------------#
@user.route('/user/login', methods=["POST", 'GET'])
def login():
    login_form = Login_form()

    if login_form.validate_on_submit():
        email = re.match(r'^[a-zA-Z0-9]+\@[a-z]+\.com$', login_form.email.data).group(0)
        check_email = db.session.query(Login).filter_by(email=email).first_or_404()
        if check_email:
            form_password = login_form.password.data
            check_password = check_password_hash(check_email.password, re.match(r'\w+[!@#$%&]{0,4}', login_form.password.data).group(0))

            if check_password:
                login_user(check_email, remember=login_form.remember.data)
                return redirect(url_for('user.index', next=request.endpoint))
            else:
                flash('Password match not found!', 'danger')
                return redirect(url_for('user.login', login_form=login_form))
        else:
            flash('Email match not found!', 'danger')
            return redirect(url_for('user.login', login_form=login_form))
    else:
        return render_template('login.html', login_form=login_form)



@user.route('/business')
@login_required
def business():
    tmp_business = [post for post in db.session.query(Post).all()[:31]]
    choice_id = random.randint(1, len(tmp_business)-1)

    return redirect(url_for('user.post_direction', no=choice_id))

@user.route('/life')
@login_required
def life():
    tmp_business = [post for post in db.session.query(Post).all()[:31]]
    choice_id = random.randint(1, len(tmp_business)-1)

    return redirect(url_for('user.post_direction', no=choice_id))

@user.route('/investment')
@login_required
def investment():
    tmp_business = [post for post in db.session.query(Post).all()[:31]]
    choice_id = random.randint(1, len(tmp_business)-1)

    return redirect(url_for('user.post_direction', no=choice_id))

@user.route('/money')
@login_required
def money():
    tmp_business = [post for post in db.session.query(Post).all()[:31]]
    choice_id = random.randint(1, len(tmp_business)-1)

    return redirect(url_for('user.post_direction', no=choice_id))
# --------------------------- End home page category ---------------------------#


# ----------------------- Like and un-like recieve data from ajax --------------#
@user.route('/post_likes', methods=['POST'])
@login_required
def is_like():
    data = request.get_json()
    l_post = db.session.query(Post).filter_by(id=data[0]['id']).first_or_404()

    if data[0]['is_like']:
        l_post.like += data[0]['like']
        db.session.commit()
    else:
        l_post.unlike += data[0]['like']
        db.session.commit()
# ---------------- End like and un-like recieve data from ajax --------------#

# ------------------------ Start logout route------------------------#
@user.route('/user/logout')
@login_required
def logout():
    logout_user()
    return redirect(url_for('user.index'))
# ------------------------ End logout route -------------------------#

# ------------------------ Start 'reset_password' route------------------------#
@user.route('/reset_password/<token>')
def reset_password(token):
    return 'I have not define yet.'
# ------------------------ End 'reset_password' route -------------------------#