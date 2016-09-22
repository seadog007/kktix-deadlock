var system = require('system');
var args = system.args;

var eventname = args[1]
var c = args[2]
console.log(c + ': Script Started');
var page = require('webpage').create();
page.open('https://kktix.com/events/'+ eventname +'/registrations/quickly', function() {
  page.render('./log/' + eventname + '_' + c + '_init.png');
  page.includeJs("http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", function() {
    page.evaluate(function() {
      $('button.btn')[0].click()
      $('.plus').click()
      $('#person_agree_terms').click()
      $('button.btn:nth-child(1)').click()
    });
  });
  window.setTimeout(function (){
    page.render('./log/' + eventname + '_' + c + '_final.png');
    console.log(c + ': Loaded the ads page');
    phantom.exit();
  }, 3000);
});
