use tanhua;
db.quanzi_publish.find({"_id":ObjectId("5fae539b7e52992e78a3b4e5")});

db.quanzi_time_line_1.deleteMany({"date":1609858716774});

db.quanzi_comment.count({"publishId":ObjectId("5fae53927e52992e78a3aecd")});

db.quanzi_publish.find({"_id":ObjectId("5fae8f3b7e5299132c69a76b")});

db.quanzi_comment.deleteOne({"created":1610350929263});

db.recommend_quanzi.deleteOne({"date":1610350931961});

db.quanzi_album_1.deleteOne({"created":1609858716774});

