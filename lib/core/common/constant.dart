const API_URL = 'http://20.198.186.162/';
const API_URL_SHOE_SERVICE = 'http://20.197.112.95'; //5
// const API_URL_CHECKOUT_SERVICE = 'http://20.195.104.212';
const API_URL_CHECKOUT_SERVICE = 'http://40.65.173.242';
const API_URL_ORDER = 'http://20.205.249.99/';

final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
