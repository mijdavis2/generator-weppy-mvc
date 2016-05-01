var glob = require('glob');
var path = require('path');
var generators = require('yeoman-generator');
var chalk  = require('chalk');
var yosay  = require('yosay');
var _ = require('lodash');

module.exports = generators.Base.extend({
  constructor: function () {
    generators.Base.apply(this, arguments);

    this.argument('namespace', {
      type: String,
      required: true,
      description: 'Generator namespace'
    });
  },

  writing: function () {
    this.fs.copyTpl(
        this.templatePath('*'),
        this.destinationPath(),
        {
          app_name: this.namespace,
          app_title: _.camelCase(this.namespace)
        }
    );
  }
});
