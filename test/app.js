'use strict';
var path = require('path');
var assert = require('yeoman-assert');
var helpers = require('yeoman-test');
var test_app_name = 'name_x';

describe('generator-weppy-mvc:app', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../app'))
      .withArguments([test_app_name])
      .on('end', done);
  });

  it('creates root files', function () {
    assert.file([
      'run.py'
    ]);
    assert.fileContent('run.py', test_app_name);
    assert.noFileContent('run.py', 'app_name');
  });
  it('creates application files', function () {
    assert.file([
      test_app_name + '/__init__.py'
    ]);
    assert.fileContent(test_app_name + '/__init__.py', test_app_name);
    assert.noFileContent(test_app_name + '/__init__.py', 'app_name');
  });
});
