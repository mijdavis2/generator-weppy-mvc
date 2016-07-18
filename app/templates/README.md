[![Build Status][travis-img]][travis-url]
[![Coverage Status][coverall-img]][coverall-url]
[![Weppy Version](https://img.shields.io/badge/weppy-0.7.6-blue.svg)](https://github.com/gi0baro/weppy)


# <%= app_title %>
 
A [Weppy](http://weppy.org) application.

<%= packageDescription %>

## Run

**Requirements**:
- Python <%= reqMajor %>.<%= reqMinor %>.<%= reqPatch %>+

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

[<%= license %>](LICENSE) <%= year %> <%= username %>


[travis-img]: https://travis-ci.org/<%= username %>/<%= app_name %>.svg?branch=master
[travis-url]: https://travis-ci.org/<%= username %>/<%= app_name %>
[coverall-img]: https://coveralls.io/repos/github/<%= username %>/<%= app_name %>/badge.svg?branch=master
[coverall-url]: https://coveralls.io/github/<%= username %>/<%= app_name %>?branch=master
