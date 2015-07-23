var express = require('express');
// Constants
var PORT = 8080;
// App
var app = express();
app.get('/', function (req, res) {
  var response = 'Greetings!!...';
  response+='........[This request was served by:' + addresses + ']';
  res.send(response);
});
app.listen(PORT);
console.log('Running on http://localhost:' + PORT);

var os = require('os');

var interfaces = os.networkInterfaces();
var addresses = [];
for (var k in interfaces) {
    for (var k2 in interfaces[k]) {
        var address = interfaces[k][k2];
        if (address.family === 'IPv4' && !address.internal) {
            addresses.push(address.address);
        }
    }
}

console.log(addresses);
