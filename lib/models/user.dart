import '../string_util.dart';

enum LoginType { email, phone }

class User {
  String email;
  String phone;

  String _firstName;
  String _lastName;
  LoginType _type;

  List<User> friends = <User>[];
  //List<User> friends = List<User>();
  //List<User> friends = [];

  User._({String firstName, String lastName, String phone, String email})
      : _firstName = firstName,
        _lastName = lastName,
        this.phone = phone,
        this.email = email {
    print("User is created");
    _type = email != null ? LoginType.email : LoginType.phone;
  }

  factory User({String name, String phone, String email}) {
    if (name.isEmpty) throw Exception("User name is empty");
    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        phone: checkPhone(phone),
        email: checkEmail(email));
  }

  factory User.withPhone({String name, String phone}) {
    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        phone: checkPhone(phone));
  }

  factory User.withEmail({String name, String email}) {
    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        email: checkEmail(email));
  }

  // это не геттер!!!
  static String _getFirstName(String userName) => userName.split(" ")[0];
  static String _getLastName(String userName) => userName.split(" ")[1];

  static String checkPhone(String phone) {
    if (phone == null) {
      throw Exception("Enter don't empty phone number");
    }
    String pattern = r"^(?:[+0])?[0-9]{11}";
    phone = phone.replaceAll(RegExp("[^+\\d]"), "");
    if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception(
          "Enter valid phone number starting with a + and containing 11 digits");
    }
    return phone;
  }

  static String checkEmail(String email) {
    if (email == null) {
      throw Exception("Enter don't empty email");
    }
    String pattern =
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    if (!RegExp(pattern).hasMatch(email)) {
      throw Exception("Enter valid email");
    }
    return email;
  }

  String get login {
    if (_type == LoginType.phone) return phone;
    return email;
  }

  String get name => "${"".capitalize(_firstName)} ${"".capitalize(_lastName)}";

  @override
  int get hashCode {
    int result = 17;
    result = 31 * result + _firstName.hashCode;
    result = 31 * result + _lastName.hashCode;
    result = 31 * result + phone.hashCode;
    result = 31 * result + email.hashCode;
    return result;
  }

  @override
  bool operator ==(Object object) {
    if (identical(this, object)) return true;
    if (object is! User) return false;
    //if (object == null) return false;
    if (object is User) {
      return _firstName == object._firstName &&
          _lastName == object._lastName &&
          (phone == object.phone || email == object.email);
    }
    return false;
  }

  void addFriends(Iterable<User> newFriend) {
    friends.addAll(newFriend);
  }

  void removeFriends(User user) {
    friends.remove(user);

    /*friends.forEach((data) {
      if (data == user){}
    });*/
  }

  String get userInfo => '''
    name: $name
    email: $email
    phone: $phone
    type: $_type
    login: $login
    firstname: $_firstName
    lastname: $_lastName
    friends: ${friends.toList()}
  ''';

  String toString() {
    return '''
    name: $name
    email: $email
    friends: ${friends.toList()}
  ''';
  }
}
