const 설정 = require("./config.js"),
			디비 = require('mariadb');
const server={
	DB : (sql, paramMap, callback) => {
			var 풀 = 디비.createPool(설정.jdbc);
			풀.getConnection().then((conn) => {
						conn.query(sql, paramMap).then((res) => {
								conn.end();
								callback(null, res);
						}).catch((err) => {
								console.log(err);
								conn.end();
								callback(err, null);
						});
			}).catch((err) => {
					console.log(err);
					callback(err, null);
			});
	}
}

module.exports=server;
// module.exports=(sql, paramMap, callback) => {
// 		var 풀 = 디비.createPool(설정.jdbc);
// 		풀.getConnection().then((conn) => {
// 					conn.query(sql, paramMap).then((res) => {
// 							conn.end();
// 							callback(null, res);
// 					}).catch((err) => {
// 							console.log(err);
// 							conn.end();
// 							callback(err, null);
// 					});
// 		}).catch((err) => {
// 				console.log(err);
// 				callback(err, null);
// 		});
// }
