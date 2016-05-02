'use strict';
var path = require('path');
var assert = require('yeoman-assert');
var helpers = require('yeoman-test');
var testAppName = 'name_x';

describe('generator-weppy-mvc:app', function () {
  before(function (done) {
    helpers.run(path.join(__dirname, '../app'))
      .withArguments([testAppName])
      .on('end', done);
  });

  it('creates root files', function () {
    assert.file([
      'run.py',
      '.coveragerc',
      '.gitignore'
    ]);
    assert.fileContent('run.py', testAppName);
    assert.noFileContent('run.py', 'app_name');
  });
  it('creates application files', function () {
    assert.file([
      testAppName + '/__init__.py'
    ]);
    assert.fileContent(testAppName + '/__init__.py', testAppName);
    assert.noFileContent(testAppName + '/__init__.py', 'app_name');
  });
  it('creates test files', function () {
    assert.file([
      'tests/fixtures.py'
    ]);
    assert.fileContent('tests/fixtures.py', testAppName);
    assert.noFileContent('tests/fixtures.py', 'app_name');
  });
});
