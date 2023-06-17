class User {
  final String id;
  final String email;
  final String phone;
  final String password;

  User(
      {required this.id,
      required this.email,
      required this.phone,
      required this.password});

  User.fromEmail({required this.email})
      : id = "",
        phone = "",
        password = "";

  User.fromPhone({required this.phone})
      : id = "",
        email = "",
        password = "";

  User.shrink()
      : id = "",
        email = "",
        phone = "",
        password = "";
}
