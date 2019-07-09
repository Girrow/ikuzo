var express = require("express"),
      router = express.Router();

router.use((req,res,next)=>{
  console.log("11");
  next();
});

router.route("/").get((req, res) => {
    // if(req.session.user){
    //   res.render("./index2.html",{user : req.session.user});
    // }else {
      res.render("m12/index.html",{data:1});
    // }
});

module.exports = router;
