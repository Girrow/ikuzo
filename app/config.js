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
      host:"",
      user:"m15",
      password:"m15",
      database:"hole",
      port:"53306",
      debug:false
    }
};
