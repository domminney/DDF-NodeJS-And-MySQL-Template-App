var express = require('express')
var cors = require('cors')
var formidable=require('express-formidable')

var account=require('./modules/account')

var app=express()

app.use(cors())
app.use(formidable())

app.use('/api/account',account.router)


app.listen(4000,function(){
    
    console.log("Listening on 4000!")

})