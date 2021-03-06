module.exports = {
    server_port: 80,
    server_session: {
        secret:"keyboard cat",
        resave:false,
        saveUninitialized:true
    },
    server_error: {
      static: {
        "404":"./error/404.html"
      }
    },
    jdbc : {
      connectionLimit:1,
      host:"192.168.29.131",
      user:"root",
      password:"1234",
      database:"test",
      port:"3306",
      debug:false,
      multipleStatements: true
    }
};
