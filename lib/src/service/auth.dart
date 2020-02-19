

import 'package:login_sqlite/src/helper/user_query.dart';
import 'package:login_sqlite/src/model/user.dart';

class AuthService {
  UserQuery _userQuery = new UserQuery();

  Future<User> getLogin(String username, String password) async {
    return await this._userQuery.getLogin(username, password);
  }

  Future<int> getRegister(User user) async {
    return this._userQuery.getRegister(user);
  }

  Future<List<User>> getUsers() async {
    return await this._userQuery.getAllUser();
  }
}