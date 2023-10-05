from app import app, db, User
with app.app_context():
    # Query the user you want to delete
    user_to_delete = User.query.filter_by(age=65).first()

    # Check if the user exists and then delete them
    if user_to_delete:
        db.session.delete(user_to_delete)
        db.session.commit()
        print("User deleted successfully")
    else:
        print("User not found")