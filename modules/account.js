var express = require('express')
var router = express.Router()
var ddf = require('./ddfGeneral')
var crypto = require('crypto')
const { resSend, resStatuses } = require('./ddfGeneral')

exports.router = router

router.post("/signup", async function (req, res) {

    var userdata = req.fields
    var errors = []

    userdata.email = userdata.email?.toString() ?? ''
    userdata.firstname = userdata.firstname?.toString() ?? ''
    userdata.lastname = userdata.lastname?.toString() ?? ''
    userdata.password = userdata.password?.toString() ?? ''
    userdata.confirmpassword = userdata.confirmpassword?.toString() ?? ''

    if (!ddf.validateEmail(userdata.email)) errors.push("Bad Email Address")
    if (userdata.firstname.length === 0) errors.push("No First Name")
    if (userdata.lastname.length < 2) errors.push("No Last Name")
    if (userdata.password.length < 8) errors.push("Password Must Be At Least 8 Chars")
    if (userdata.password !== userdata.confirmpassword) errors.push("Passwords Do Not Match")

    if (errors.length === 0) {
        
        var dbRsp = await ddf.dbGetSingleValue("select count(*) as val from users where email=?", [userdata.email])

        console.log(dbRsp)

        if (dbRsp !== 0) {

            ddf.resSend(res,null,ddf.resStatuses.error,"User With Email Already Exists")

            con.end()

            return false            

        }

        var salt = ddf.uniqueStr(255)
        var hash = getHash(userdata.password, salt)
        var confcode = ddf.uniqueStr(45)

        userdata.id = await ddf.dbInsert("insert into users values (0,?,?,?,now(),1,?,?)", [
            userdata.email,
            userdata.firstname,
            userdata.lastname,
            hash,
            confcode
        ])

        await ddf.dbInsert("insert into salts values (0,?,?)", [userdata.id, salt])

        var token = await createToken(userdata.id)

        ddf.resSend(res,{token})
       
        return false

    }

    ddf.resSend(res,null,ddf.resStatuses.error,errors)

})

router.post("/gettoken", async function(req,res){

    var userdata=req.fields
    userdata.email=userdata.email ?? ''
    userdata.password=userdata.password ?? ''

    if (!ddf.validateEmail(userdata.email)) {
        ddf.resSend(res,{},ddf.resStatuses.error,"Invalid Email")
        return false
    }

    if (userdata.password.length<8) {
        ddf.resSend(res,{},ddf.resStatuses.error,"Must Supply A Password")
        return false
    }

    var userid=await ddf.dbGetSingleValue("select id as val from users where status<2 and email=?",[userdata.email],0)

    if (userid===0) {
        ddf.resSend(res,{},ddf.resStatuses.error,"Incorrect Email Or Password")
        return false
    }

    var salt= await ddf.dbGetSingleValue("select salt as val from salts where userid=?",[userid],'')

    var hash=getHash(userdata.password,salt)

    var dbHash=await ddf.dbGetSingleValue("select pwhash as val from users where id=?",[userid],'')

    if (hash===dbHash){
        var token=await createToken(userid)
        ddf.resSend(res,{token})
        return false
    }

    ddf.resSend(res,{},ddf.resStatuses.error,"Incorrect Email Or Password")
    
})

router.post("/changename",async function(req,res){

    var userid=await checkToken(req,res)
    if (userid===0) return false


    var userdata = req.fields   
    userdata.firstname = userdata.firstname?.toString() ?? ''
    userdata.lastname = userdata.lastname?.toString() ?? ''
    
    var errors=[]

    if (userdata.firstname.length === 0) errors.push("No First Name")
    if (userdata.lastname.length < 2) errors.push("No Last Name")

    if (errors.length===0){

        await ddf.dbQuery("update users set firstname=?,lastname=? where id=?",[userdata.firstname,userdata.lastname,userid])

        ddf.resSend(res)

        return false
    }

    ddf.resSend(res,null,ddf.resStatuses.error,errors)


})

async function checkToken(req,res){

    var token=req.headers.token
    
    token=token ?? ''
    var userid=await getUserIdFromToken(token)

    if (userid===0){
        ddf.resSend(res,{},ddf.resStatuses.error,"Invalid Token")
        return 0
    }

    return userid

}

exports.checkToken=checkToken

async function getUserIdFromToken(token){

    var userid=await ddf.dbGetSingleValue("select userid as val from tokens where token=?",[token],0)

    return userid

}

exports.getUserIdFromToken=getUserIdFromToken

function getHash(pwd, salt) {
    var hashBuffer = crypto.pbkdf2Sync(pwd, salt, 100000, 255, 'sha512')
    var hashString = Buffer.from(hashBuffer, 'hex').toString('base64')
    return hashString.slice(-255)
}

async function createToken(userid) {

    var token = ddf.uniqueStr(255)

    await ddf.dbInsert("insert into tokens values (0,?,?,now())", [userid, token])
  
    return token

}