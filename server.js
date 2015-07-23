var express = require('express');
// Constants
var PORT = 8080;
// App
var app = express();
app.get('/', function (req, res) {
  res.send('Hello world...Hows it going?...Is today Thursday?..Checking whether same image name can be used...name is demoapp!');
});
app.listen(PORT);
console.log('Running on http://localhost:' + PORT);
