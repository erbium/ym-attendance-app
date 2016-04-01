# YM Attendance App

This is a little Ember-Cordova app for handling attendance in our ward's young men's program. We like to track service hours and temple names since the young men have goals for these things. So instead of gathering a simple attendance record we gather those stats and make a little competition of it.

# Contributing

Here is an outline of the details of collaborating on this Ember application.

## Prerequisites

You will need the following things properly installed on your computer.

* [Git](http://git-scm.com/)
* [Node.js](http://nodejs.org/) (with NPM)
* [Bower](http://bower.io/)
* [Ember CLI](http://www.ember-cli.com/)
* [PhantomJS](http://phantomjs.org/)

## Installation

* `git clone <repository-url>` this repository
* change into the new directory
* `npm install`
* `bower install`

I haven't tested the above, there may be some complications with Cordova in there. If so, post an issue and I'll see if I can help out.

## Running / Development

You can preview the app in your browser:

* `EMBER_CLI_CORDOVA=0 ember serve`
* Go to [http://localhost:4200](http://localhost:4200).

Or on the phone (if you have debugging enabled and you're plugged in):

* `ember cordova:build`
* `ember cordova run`

### Code Generators

Make use of the many generators for code, try `ember help generate` for more details. You'll see that the blueprints use things like coffeescript, sass, and emblem. So pay attention to the fact that this is written in those languages instead of the standard javascript, css, and handlebars.

### Running Tests

* `ember test`
* `ember test --server`

### Building

* `ember build` (development)
* `ember build --environment production` (production)

## Further Reading / Useful Links

* [ember.js](http://emberjs.com/)
* [ember-cli](http://www.ember-cli.com/)
* Development Browser Extensions
  * [ember inspector for chrome](https://chrome.google.com/webstore/detail/ember-inspector/bmdblncegkenkacieihfhpjfppoconhi)
  * [ember inspector for firefox](https://addons.mozilla.org/en-US/firefox/addon/ember-inspector/)
