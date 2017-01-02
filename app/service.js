'use strict';
var request = require('request-json');
var client = request.createClient('http://pypi.python.org/pypi/weppy/');

function getReleases(data) {
  var releases = [];
  for (var x in data.releases) {
    if (Object.prototype.hasOwnProperty.call(data.releases, x)) {
      releases.push(x);
    }
  }
  return releases;
}

function cmpVersions (a, b) {
  var i, diff;
  var regExStrip0 = /(\.0+)+$/;
  var segmentsA = a.replace(regExStrip0, '').split('.');
  var segmentsB = b.replace(regExStrip0, '').split('.');
  var l = Math.min(segmentsA.length, segmentsB.length);

  for (i = 0; i < l; i++) {
    diff = parseInt(segmentsA[i], 10) - parseInt(segmentsB[i], 10);
    if (diff) {
      return diff;
    }
  }
  return segmentsA.length - segmentsB.length;
}

module.exports = {
  getWeppyVersions: function() {
    var choices = [];
    client.get('json/')
      .then(function(result) {
        var releases = getReleases(result.body);
        // console.log(releases);
        var sortedReleases = releases.sort(cmpVersions).reverse();
        // console.log(sortedReleases);
        sortedReleases.forEach(function(x) {
          choices.push({name: x, value: x});
        });
      }
    );
    return choices;
  }
};
