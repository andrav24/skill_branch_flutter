extension MyString on String {
  String capitalize(String s) =>
      s[0].toUpperCase() + s.substring(1).toLowerCase();
}

abstract class UserUtils {
  factory UserUtils._() => null;

  String capitalize(String s) =>
      s[0].toUpperCase() + s.substring(1).toLowerCase();
}
