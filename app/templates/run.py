from contextlib import contextmanager
from argparse import ArgumentParser
from <%= appName %> import app


@contextmanager
def run_in_dev():
    from <%= appName %>.dev_utils import remove_admin, remove_user
    try:
        yield
    finally:
        remove_admin()
        remove_user()


if __name__ == "__main__":
    arg_parser = ArgumentParser(description="<%= appTitle %> running utility.")
    arg_parser.add_argument('-d', '--dev', help="Setup add dev users and enable verbose logging",
                            action='store_true')
    args = arg_parser.parse_args()
    if args.dev:
        from <%= appName %>.dev_utils import setup_admin, setup_user
        test_admin = setup_admin()
        test_user = setup_user()
        print("Admin: {} \nUser: {}\n".format(test_admin.as_dict(), test_user.as_dict()))
        with run_in_dev():
            app.run()
    else:
        app.run(host="0.0.0.0", debug=False)
