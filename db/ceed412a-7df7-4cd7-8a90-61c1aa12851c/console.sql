show dbs;

use db_test;

db.createCollection("test");

db.test.insertOne({"username":"zhangsan", "age":"23"});
db.test.insertOne({"aa":"aa", "bb":"bb"});

db.test.save();
db.test.remove();

db.test.find({},{age:1});