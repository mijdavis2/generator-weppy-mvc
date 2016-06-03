[![Build Status][travis-img]][travis-url]
[![Coverage Status][coverall-img]][coverall-url]

# <%= app_title %>
 
A [Weppy](http://weppy.org) application.

## Run

**Requirements**:
- Python 3.4+ or 3.5+

For automated pip and virtual env setup and creation:

```
. ./setup.sh
python run.py
```

Otherwise:

```
pip install -r requirements.txt
python run.py
```

### Docker

To make your application available at ```http://localhost/```:

```
docker build -t <%= app_name %> .
docker run -it -p 80:8000 --rm --name <%= app_name %> <%= app_name %>
```


## Develop

Running in development mode will enable debug pages and
automatically create test users in multiple states.
Test users will be removed from the DB after stopping.

To start the app in development mode, do:

```
python run.py --dev
```

See ```<%= app_name %>/cli.py``` for cli commands. 

## Test

```
py.test -v -s --cov-report term-missing --cov=<%= app_name %> -r w tests
```


## License

MIT


[travis-img]: https://travis-ci.org/<%= user_name %>/<%= app_name %>.svg?branch=master
[travis-url]: https://travis-ci.org/<%= user_name %>/<%= app_name %>
[coverall-img]: https://coveralls.io/repos/github/<%= user_name %>/<%= app_name %>/badge.svg?branch=master
[coverall-url]: https://coveralls.io/github/<%= user_name %>/<%= app_name %>?branch=master
