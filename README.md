[![NPM version][npm-image]][npm-url] 
[![Build Status][travis-image]][travis-url] 
[![Coverage percentage][coveralls-image]][coveralls-url] 
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/ce0ad20ca59947af86b0f17a5779c804)](https://www.codacy.com/app/mijdavis2/generator-weppy-mvc?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=mijdavis2/generator-weppy-mvc&amp;utm_campaign=Badge_Grade)

# generator-weppy-mvc
 
[![NPM](https://nodei.co/npm/generator-weppy-mvc.png?downloads=true&downloadRank=true&stars=true)](https://nodei.co/npm/generator-weppy-mvc/)

This generator is based on the latest version of the [starter-weppy](https://github.com/mijdavis2/starter_weppy) project.

## Features
- Pythonic MVC framework
- API module and examples included
- Pythonic Haml
- 100% Test Coverage
- Bootstrap

> ### Starter Weppy
> [![Build Status](https://travis-ci.org/mijdavis2/starter_weppy.svg?branch=master)](https://travis-ci.org/mijdavis2/starter_weppy) [![Coverage Status](https://coveralls.io/repos/github/mijdavis2/starter_weppy/badge.svg?branch=master)](https://coveralls.io/github/mijdavis2/starter_weppy?branch=master)
> [Starter-weppy](https://github.com/mijdavis2/starter_weppy) is a python web application starter kit developed on the [weppy framework](https://github.com/gi0baro/weppy). 
> Current version is based on Weppy 0.6 with an MVC scaffolding. An api module, dev mode, and 100% test coverage are included out of the box.
>
> Live demo soon to come.

## Installation

Requires [Yeoman](http://yeoman.io) (we assume you have pre-installed [node.js](https://nodejs.org/)).

```bash
npm install -g yo
npm install -g generator-weppy-mvc
```

## Usage

Then generate your new project:

**Note:** Use a python import safe app name (i.e. _no dashes_).

```bash
mkdir my_weppy_app
cd my_weppy_app
yo weppy-mvc my_weppy_app
```


## Testing

Simply use

``` 
mocha
```

## ToDo
[ ] Prompt for yeoman for optional bootstrap

## License

MIT © [mijdavis2](http://mdavisinsc.com)


[npm-image]: https://badge.fury.io/js/generator-weppy-mvc.svg
[npm-url]: https://npmjs.org/package/generator-weppy-mvc
[travis-image]: https://travis-ci.org/mijdavis2/generator-weppy-mvc.svg?branch=master
[travis-url]: https://travis-ci.org/mijdavis2/generator-weppy-mvc
[coveralls-image]: https://coveralls.io/repos/mijdavis2/generator-weppy-mvc/badge.svg
[coveralls-url]: https://coveralls.io/r/mijdavis2/generator-weppy-mvc
