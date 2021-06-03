var mysql = require('mysql2')

module.exports = { 
    getConn: function () {
        var con = mysql.createConnection({
            "host": "127.0.0.1",
            "user": "davetest",
            "password": "davetest",
            "database": "davetest"
        })

        con.connect(function (err) {
            if (err) throw err
        })

        return con
    },
    validateEmail: function (email) {
        const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    },
    uniqueStr: function (length) {

        if (!length) {
            length = 128;
        }

        var s = [];
        var digits = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-_";
        for (var i = 0; i < length; i++) {
            s[i] = digits.substr(Math.floor(Math.random() * digits.length - 1), 1);
        }

        var guid = s.join("");
        return guid;
    },
    dbQuery: async function (query, param) {

        var con = this.getConn()

        var data = await con.promise().query(query, param)

        con.end()

        return data[0]

    },
    dbGetSingleRow: async function (query, param) {

        var data = await this.dbQuery(query, param)

        return data[0]

    },
    dbGetSingleValue: async function (query, param, defaultValue) {

        var data = await this.dbGetSingleRow(query, param)

        data = data ?? {}

        data = data.val ?? defaultValue

        return data

    },
    dbInsert: async function (query, param) {

        var con = this.getConn()

        var data = await con.promise().query(query, param)

        con.end()

        return data[0].insertId

    },
    resSend(res, data, status, errors) {
        data = data ?? {}
        status = status?.toString() ?? this.resStatuses.ok
        errors = errors ?? []
        if (!Array.isArray(errors)) errors = [errors]

        var rspJson = {}
        rspJson.status = status
        rspJson.errors = errors
        rspJson.data = data

        res.send(JSON.stringify(rspJson))

    },
    resStatuses: Object.freeze({ "ok": "OK", "error": "Error" })
}