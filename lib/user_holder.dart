import 'package:FlutterGalleryApp/models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);
    //User user2 = User(name: name, phone: phone, email: email);

    print(user);

    if (!users.containsKey(user.login)) {
      //users.addAll({user.login: user});
      users[user.login] = user;
    } else {
      throw Exception("A user with this name already exists");
    }

    //print(user == user2);
  }

  User getUserByLogin(String login) {
    return users[login];
  }

  User registerUserByPhone(String fullName, String phone) {
    User user = User.withPhone(name: fullName, phone: phone);
    String login = user.login;
    if (users.containsKey(login)) {
      user = users[login];
    } else {
      users[login] = user;
    }
    return user;
  }

  User registerUserByEmail(String fullName, String email) {
    User user = User.withEmail(name: fullName, email: email);
    String login = user.login;
    if (users.containsKey(login)) {
      throw Exception("A user with this email already exists");
    } else {
      users[login] = user;
    }
    return user;
  }
}
