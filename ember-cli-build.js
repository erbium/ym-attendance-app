/*jshint node:true*/
/* global require, module */
var EmberApp = require('ember-cli/lib/broccoli/ember-app');

module.exports = function(defaults) {
  var app = new EmberApp(defaults, {
    emberCliFontAwesome: { useScss: true }
  });

  app.import('vendor/firebase.js')
  
  return app.toTree();
};
