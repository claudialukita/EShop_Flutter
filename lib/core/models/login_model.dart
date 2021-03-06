class LoginModel {
  final String email;
  final String password;

  LoginModel(this.email, this.password);

  LoginModel.fromJson(Map<String, dynamic> json) :
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() =>
      {
        'email': email,
        'password': password
      };
}

class LoginResponse {
  final String message;

  LoginResponse(this.message);
}

class LoginValidation {
  final bool validateEmail;
  final bool validatePass;

  LoginValidation(this.validateEmail, this.validatePass);
}