class UserModel {
  String firstname, lastname, title, email;

  UserModel(
      {this.firstname = '',
      this.lastname = '',
      this.title = '',
      this.email = ''});

  static UserModel fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> name = json['name'];
    return UserModel(
        email: json['email'],
        firstname: name['first'],
        lastname: name['last'],
        title: name['title']);
  }
}
