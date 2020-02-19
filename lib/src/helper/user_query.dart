import 'dart:async';

import 'package:login_sqlite/src/helper/database.dart';
import 'package:login_sqlite/src/model/user.dart';

class UserQuery {
  DatabaseHelper con = new DatabaseHelper();

  Future<int> getRegister(User user) async {
    var db = await con.db;

    try {
      int res = await db.insert("User", user.toMap());
      return res;
    } on Exception catch(e) {
      return -1;
    }
  }

  Future<User> getLogin(String user, String password) async {
    var db = await con.db;
    var res = await db.rawQuery("SELECT * FROM user WHERE username = '$user' and password = '$password'");

    if (res.length > 0) {
      return new User.fromMap(res.first);
    }

    return null;
  }

  Future<List<User>> getAllUser() async {
    var db = await con.db;
    var res = await db.query("user");

    List<User> list = res.isNotEmpty ? res.map((c) => User.fromMap(c)).toList() : null;
    return list;
  }
}