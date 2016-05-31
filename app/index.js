var glob = require('glob');
var path = require('path');
var generators = require('yeoman-generator');
var _ = require('lodash');

module.exports = generators.Base.extend({
  constructor: function () {
    generators.Base.apply(this, arguments);

    this.argument('namespace', {
      type: String,
      required: true,
      description: 'Generator namespace'
    });

    this.argument('username', {
      type: String,
      required: true,
      description: 'Generator username'
    });
  },

  writing: function () {
    this.fs.copyTpl(
        this.templatePath('*'),
        this.destinationPath(),
        {
          app_name: this.namespace,
          app_title: _.startCase(this.namespace),
          user_name: this.username
        }
    );
  this.fs.copyTpl(
      this.templatePath('starter_weppy/**/*'),
      this.destinationPath(this.namespace),
      {
          app_name: this.namespace,
          app_title: _.startCase(this.namespace),
        user_name: this.username
      }
  );
  this.fs.copyTpl(
      this.templatePath('tests/*'),
      this.destinationPath('tests'),
      {
          app_name: this.namespace,
          app_title: _.startCase(this.namespace),
        user_name: this.username
      }
  );
  this.fs.copyTpl(
      this.templatePath('.*'),
      this.destinationPath(),
      {
          app_name: this.namespace,
          app_title: _.startCase(this.namespace),
        user_name: this.username
      }
  );
  }
});
