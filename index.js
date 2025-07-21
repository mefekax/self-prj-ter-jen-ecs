var express=require('express');
var app=express();
app.get('/',function (req,res)
{
    res.send('Hello World! This is a simple Express app. You can access this app at http://localhost:3000/ or http://127.0.0.1:3000/ . Feel free to modify the code and explore more features of Express.js!');
});
var server=app.listen(3000,function() {
    var host=server.address().address;
    var port=server.address().port;

    console.log('Example app listening at http://%s:%s',host,port);

});
