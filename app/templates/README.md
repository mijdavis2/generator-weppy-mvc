[![Build Status](https://travis-ci.org/<%= user_name %>/<%= app_name %>.svg?branch=master)](https://travis-ci.org/<%= user_name %>/<%= app_name %>)
[![Coverage Status](https://coveralls.io/repos/github/<%= user_name %>/<%= app_name %>/badge.svg?branch=master)](https://coveralls.io/github/<%= user_name %>/<%= app_name %>?branch=master)

# <%= app_title %> 

## Run

**Requirements**:
- Python 3.4+ or 3.5+

For automated pip and virtual env setup and creation, 
clone this repository and in your terminal do:

```
. ./setup.sh
python run.py
```

Otherwise, do:

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

Running in development mode will enable debug pages,
automatically create test, users in multiple states,
and upon killing the app, those test users will automatically be 
deleted from the DB.

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

---
<%= app_title %> created using [generator-weppy-mvc](https://github.com/mijdavis2/generator-weppy-mvc).
