var express = require("express"),
  server = require("./db.js"),
  router = express.Router();

router.use((req, res, next) => {
  next();
});

router.route("/").get((req, res) => {
  server.DB("select * from s_notices where type_flag=1 order by notice_no desc", [], (err, resultList) => {
    if (err) {
      res.redirect("/main");
      return;
    }

    console.log(resultList);
    res.render("m12/index.html", {
      data: resultList
    });
  });
});
router.route("/inquiryAd").get((req, res) => {
  server.DB("select * from s_notices where type_flag=2 order by notice_id desc", [], (err, resultList) => {
    if (err) {
      res.redirect("/main");
      return;
    }

    res.render("m12/inquiryAd.html", {data :resultList});
  });
});
router.route("/inquiryGet/:id").get((req, res) => {
  server.DB("select * from s_notices_comments where notice_id= ? order by notice_id desc", [req.params.id], (err, resultList) => {
    if (err) {
      res.redirect("/main");
      return;
    }

    res.send({data :resultList});
  });
});
router.route("/noticeDetail/:id").post((req, res) => {
  server.DB("insert into s_notices_comments (notice_id,content,register,modifier) values(?,?,?,?)", [req.params.id, req.body.content, req.body.id, 'harin'], (err, resultList) => {
    if (err) {
      res.redirect("/main");
      return;
    }
    server.DB("select * from s_notices_comments where notice_id = ?", [req.params.id], (err, resultList2) => {
      if (err) {
        res.redirect("/main");
        return;
      }
      res.send({
        data: resultList2
      });
    });
    // console.log(resultList);
    // res.render("m12/index.html", {data :resultList});
  });
});

router.route("/noticeDeleteC/:id").post((req, res) => {
  server.DB("delete from s_notices_comments where notice_comment_id = ?", [req.params.id], (err, resultList) => {
    if (err) {
      res.redirect("/main");
      return;
    }
    res.send({});
    // console.log(resultList);
    // res.render("m12/index.html", {data :resultList});
  });
});

router.route("/faqDelete/:id").post((req, res) => {
  server.DB("delete from s_faqs where faq_id = ?", [req.params.id], (err, resultList) => {
    if (err) {
      res.redirect("/main");
      return;
    }
    res.send({});
    // console.log(resultList);
    // res.render("m12/index.html", {data :resultList});
  });
});
router.route("/faqUpdate/:temp1/:temp2").post((req, res) => {
  // console.log(req.params.temp1);
  // console.log(req.params.temp2);
  if (req.params.temp1 == req.params.temp2) {
    let sql = "";
    for (let j = 0; j < req.params.temp2; j++) {
      sql += `update s_faqs set question="${req.body[`main[${j}][question]`]}", answer="${req.body[`main[${j}][answer]`]}" where faq_id = ${j+1};`;
    }
    console.log(sql);
    server.DB(sql, [], (err, resultList) => {
      if (err) {
        return;
      }
      console.log("12345");
      res.status(200).send({
        data: resultList
      });
    });
    // server.DB(`update s_faqs set question=${req.body.data}`)
  } else if (req.params.temp1 < req.params.temp2) {
    console.log(req.params.temp1, req.params.temp2);
    let sql = "";
    for (let j = 0; j < req.params.temp1; j++) {
      sql += `update s_faqs set question="${req.body[`main[${j}][question]`]}", answer="${req.body[`main[${j}][answer]`]}" where faq_id = ${j+1};`;
    };
    for (let j = req.params.temp1; j < req.params.temp2; j++) {
      sql += `insert into s_faqs(question,answer) values("${req.body[`main[${j}][question]`]}","${req.body[`main[${j}][answer]`]}");`;
    };

    server.DB(sql, [], (err, resultList) => {
      if (err) {
        return;
      }
      console.log("12345");
      res.status(200).send({
        data: resultList
      });
    });
    //   select A.*,ROW_NUMBER() OVER () as numb
    // from s_faqs as A
  }
});

// router.route("/inquiry/add").post((req, res) => {
//     let a=req.body.title;
//     let b=req.body.content;
//     console.log("==============================================");
//     console.log("여기서부터"+a);
//     console.log(b);
//     console.log(req.params.id);
//     server.DB("")
//     server.DB("insert into s_notices(title,content,register,type_flag) values(?,?,?,?)", [req.body.title,req.body.content,"harin",2], (err, resultList) => {
//       if(err){
//         console.log(err);
//         res.redirect("/main");
//         return;
//       }
//       console.log(resultList);
//       res.redirect("/inquiry");
//     });
// });
// router.route("/index/writeNew").get((req, res) => {
//       res.render("m12/noticeWrite2.html");
// }).post((req, res) => {
//     let a=req.body.title;
//     let b=req.body.content;
//     console.log("==============================================");
//     console.log("여기서부터"+a);
//     console.log(b);
//     console.log(req.params.id);
//     server.DB("insert into s_notices(type_flag,subtitle,title,content,register) values(1,'서비스 뉴스',?,?,'harin')", [req.body.title,req.body.content], (err, resultList) => {
//       if(err){
//         console.log(err);
//         res.redirect("/main");
//         return;
//       }
//       console.log(resultList);
//       res.redirect("/index");
//     });
// });
// router.route("/index/:id/update").get((req, res) => {
//     server.DB("select * from s_notices where notice_no ="+req.params.id, [], (err, resultList) => {
//       if(err){
//         console.log(err);
//         res.redirect("/main");
//         return;
//       }
//
//       console.log(resultList);
//       res.render("m12/noticeWrite.html", {data :resultList});
//     });
// })
// .post((req, res) => {
//     let a=req.body.title;
//     let b=req.body.content;
//     console.log("==============================================");
//     console.log("여기서부터"+a);
//     console.log(b);
//     console.log(req.params.id);
//     server.DB("UPDATE s_notices SET title = ? , content = ? where notice_no = ?", [req.body.title,req.body.content,req.params.id], (err, resultList) => {
//       if(err){
//         console.log(err);
//         res.redirect("/main");
//         return;
//       }
//       console.log(resultList);
//       res.redirect("/index/"+req.params.id);
//     });
// });
// router.route("/index/:id/delete").get((req, res) => {
//     server.DB("delete from s_notices where notice_no ="+req.params.id, [], (err, resultList) => {
//       if(err){
//         console.log(err);
//         res.redirect("/main");
//         return;
//       }
//
//       console.log(resultList);
//       res.redirect("/index");
//     });
// });
// router.route("/index/:id").get((req, res) => {
//     server.DB("select * from s_notices where notice_no ="+req.params.id, [], (err, resultList) => {
//       if(err){
//         console.log(err);
//         res.redirect("/main");
//         return;
//       }
//
//       console.log(resultList);
//       res.render("m12/noticeDetail.html", {data :resultList});
//     });
// });
//
// router.route("/index").get((req, res) => {
//     server.DB("select * from s_notices where type_flag=1 order by notice_no desc", [], (err, resultList) => {
//       if(err){
//           res.redirect("/main");
//           return;
//       }
//
//       console.log(resultList);
//       res.render("m12/index.html", {data :resultList});
//     });
// });
// router.route("/faq").get((req, res) => {
//     server.DB("select * from s_faqs", [], (err, resultList) => {
//       if(err){
//           res.redirect("/main");
//           return;
//       }
//
//       console.log(resultList);
//       res.render("m12/faq.html", {data :resultList});
//     });
// });
// router.route("/inquiry").get((req, res) => {
//     server.DB("select * from s_notices where type_flag=2 order by notice_no desc", [], (err, resultList) => {
//       if(err){
//           res.redirect("/main");
//           return;
//       }
//
//       console.log(resultList);
//       res.render("m12/inquiryTable.html", {data :resultList});
//     });
// });
// router.route("/deliveryConf").get((req, res) => {
//     server.DB("select * from b_sales", [], (err, resultList) => {
//       if(err){
//           res.redirect("/main");
//           return;
//       }
//
//       console.log(resultList);
//       res.render("m12/deliveryConf.html", {data :resultList});
//     });
// });
// router.route("/deliveryDetail/:id").get((req, res) => {
//     server.DB(`select a.*
//                  from b_sales_and_orders as a
//                 inner join b_sales as b
//                    on (
//                        b.sale_id=${req.params.id}
//                    and b.sale_id = a.sale_id)
//     `, [], (err, resultList) => {
//       if(err){
//           res.redirect("/main");
//           return;
//       }
//       console.log(JSON.stringify(resultList));
//       res.render("m12/engineerList.html", {data :resultList});
//     });
// });
// router.route("/refundForm").get((req, res) => {
//     server.DB("select * from s_returns", [], (err, resultList) => {
//       if(err){
//           res.redirect("/main");
//           return;
//       }
//
//       console.log(resultList);
//       res.render("m12/refundForm.html", {data :resultList});
//     });
// });
// router.route("/serviceInfo").get((req, res) => {
//       res.render("m12/serviceInfo.html");
// });


module.exports = router;
