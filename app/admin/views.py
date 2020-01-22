from flask import render_template, redirect, url_for,flash
from flask_login import login_required
from app.model import Login, Login_form, Post, Contacts, Signup_form
from app import db
from app.admin import admin


admin_credientials = [
    {'email': 'admin@gmail.com',
     'password': 'dalal'
     }
]


# ------------------------ Admin routes --------------------------------------#
@admin.route('/dashboard')
@login_required
def index():
    admin_content = db.session.query(Post).all()
    return render_template('home.html', admin_content=admin_content)

@admin.route('/dashboard/logins')
@login_required
def logins():
    login_detail = db.session.query(Login).all()
    return render_template('logins.html', login_detail=login_detail)


@admin.route('/dashboard/contacts')
@login_required
def contact():
    contact_detail = db.session.query(Contacts).all()
    return render_template('contacts.html', contact_detail=contact_detail)

# ------------------------- Admin content delete --------------------#
@admin.route('/dashboard/contact/delete/<int:id_no>')
@login_required
def contact_detail(id_no):
    contact_ = db.session.query(Contacts).filter_by(id=id_no).first_or_404()
    db.session.delete(contact_)
    db.session.commit()

    flash('Post has been deleted!', 'success')
    contact_detail = db.session.query(Contacts).all()
    return redirect(url_for('admin.contacts'))


@admin.route('/dashboard/login/delete/<int:id_no>')
@login_required
def login_detail(id_no):
    login_ = db.session.query(Login).filter_by(id=id_no).first_or_404()
    db.session.delete(login_)
    db.session.commit()

    flash('Post has been deleted!', 'success')
    contact_detail = db.session.query(Contacts).all()
    return render_template('logins.html', login_detail=login_detail)

@admin.route('/dashboard/post/delete/<int:id_no>')
@login_required
def delete(id_no):
    post = db.session.query(Post).filter_by(id=id_no).first_or_404()
    db.session.delete(post)
    db.session.commit()

    flash('Post has been deleted!', 'success')
    admin_content = db.session.query(Post).all()
    return render_template('index.html', admin_content=admin_content)
#-------------------------End Admin post delete ----------------------#

# ---------------------- End Admin contact ---------------------------#
@admin.route('/dashboard/contact/update/<int:id_no>', methods=['POST', 'GET'])
@login_required
def update_contact(id_no):
    if request.method == "POST":
        save_edit = db.session.query(
            Contacts).filter_by(id=id_no).first_or_404()

        save_edit.id = request.form.get('id')
        save_edit.name = request.form.get('name')
        save_edit.email = request.form.get('email')
        save_edit.phone = request.form.get('phone')
        save_edit.message = request.form.get('message')
        save_edit.date = request.form.get('date_text')

        db.session.commit()

        flash('Updated successfully!', 'success')
        admin_contact = db.session.query(Login).all()
        return redirect(url_for('admin.contacts'))
    else:
        edit_contact = db.session.query(Contacts).filter_by(id=id_no).all()
        return render_template('edit_content.html', edit_content=edit_contact)
# ---------------------- End Admin contact ---------------------------#

# ---------------------- Start Admin Login ---------------------------#
@admin.route('/dashboard/login/update/<int:id_no>', methods=['POST', 'GET'])
@login_required
def update_login(id_no):
    if request.method == "POST":
        save_edit = db.session.query(Login).filter_by(id=id_no).first_or_404()

        save_edit.id = request.form.get('id')
        save_edit.username = request.form.get('username')
        save_edit.email = request.form.get('email')
        save_edit.password = request.form.get('password')
        save_edit.date = request.form.get('date_text')

        db.session.commit()

        flash('Updated successfully!', 'success')
        admin_login = db.session.query(Login).all()
        return redirect(url_for('admin.logins', admin_content=admin_login))
    else:
        edit_login = db.session.query(Login).filter_by(id=id_no).all()
        return render_template('admin_edit_content.html', edit_content=edit_login)
# ---------------------- End Admin Login ---------------------------#

# ---------------------- Start Admin post --------------------------#
@admin.route('/dashboard/post/update/<int:id_no>', methods=["POST", "GET"])
@login_required
def update_post(id_no):
    if request.method == "POST":
        save_edit = db.session.query(Post).filter_by(id=id_no).first_or_404()

        save_edit.id = request.form.get('id')
        save_edit.title = request.form.get('title')
        save_edit.body = request.form.get('body')
        save_edit.tag = request.form.get('tag')
        save_edit.like = request.form.get('like')
        save_edit.url = request.form.get('url')
        save_edit.date = request.form.get('date_text')

        db.session.commit()

        flash('Post edited successfully!', 'success')
        admin_content = db.session.query(Post).all()
        return redirect(url_for('admin.index', admin_content=admin_content))
    else:
        edit_content = db.session.query(Post).filter_by(id=id_no).all()
        return render_template('admin_edit_content.html', edit_content=edit_content)
## ---------------------- End Admin post ---------------------------#

# ------------------------ End admin route ----------------------------------#