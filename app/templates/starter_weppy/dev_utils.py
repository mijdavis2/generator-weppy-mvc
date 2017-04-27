from late_gen import db, auth
from late_gen.models.user import User


def setup_admin():
    from tests.fixtures import TEST_ADMIN
    with db.connection():
        admins = auth.group_for_role('admins') if auth.group_for_role('admins') else auth.create_group("admins")
        print("Admin group id: '{}'".format(admins))
        admin = db.User.validate_and_insert(
            email=TEST_ADMIN.email,
            first_name=TEST_ADMIN.first_name,
            last_name=TEST_ADMIN.last_name,
            password=TEST_ADMIN.password
        )
        admins.users.add(admin)
        print("Admin created: \n{}".format(admin.as_dict()))
        db.commit()
    return admin


def remove_admin():
    from tests.fixtures import TEST_ADMIN
    with db.connection():
        print("\nRemoving test admin.")
        dev_admin = db(User.email == TEST_ADMIN.email).select()
        print("Admin: {}\n".format(dev_admin.as_dict()))
        db(User.email == TEST_ADMIN.email).delete()
        print("Test admin successfully deleted.")
        db.commit()


def setup_user():
    from tests.fixtures import TEST_USER
    with db.connection():
        user = db.User.validate_and_insert(
            email=TEST_USER.email,
            first_name=TEST_USER.first_name,
            last_name=TEST_USER.last_name,
            password=TEST_USER.password
        )
        db.commit()
    return user


def remove_user():
    from tests.fixtures import TEST_USER
    with db.connection():
        print("\nRemoving test user.")
        dev_user = db(User.email == TEST_USER.email).select()
        print("Admin: {}\n".format(dev_user.as_dict()))
        db(User.email == TEST_USER.email).delete()
        print("Test user successfully deleted.")
        db.commit()
