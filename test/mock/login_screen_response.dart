
import 'package:eshop_flutter/core/models/login_model.dart';

final dummyLogin = new LoginModel("test@gmail.com", "test123");

final dummyLoginResponse = new LoginResponse("Success");

final dummyLoginResponseApi =
{
  "statusCode": 200,
  "message": "Success",
  "result": {
    "accessToken": "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJiZWYxZDRjMy05Y2QwLTQ4YTYtOTgxYy0wMDE0OGM4MzliYzAiLCJnaXZlbl9uYW1lIjoiQnJ1Y2UiLCJmYW1pbHlfbmFtZSI6IkxlZSIsIm5iZiI6MTYzMDU1NDg4MiwiZXhwIjoxNjYxNjU4ODgyLCJpc3MiOiJFY29tTWluaVByb2plY3RTaG9lcy5Vc2VyU2VydmljZSIsImF1ZCI6IkVjb21NaW5pUHJvamVjdFNob2VzLkFjY2Vzc1Rva2VuSGFuZGxlciJ9.Jihwh0KLBNRUExI248h3BYcpHvruc4ABsJd8gcln-qepGZrAMu_ey-PayQfRPd2h4lndPPKvVxCGaBH-t7x1f884oxu2vvjsAOMK8vnLjja3-as7umNGOhIpQS50_xukLMqSmEHlXNye5FnyjCQyEFwuFl5Kjy6Bd1Wzctc_NWSLAFcjWDerbujIDpRkM9ntuHj_1bY_h6iQy6uBaxuFyypSjXSG-yDnNlXh5X8OBa9ETXRwDvp0PJvPa3AUQcpJQX5WpgatcO3aC1GMfw0EzVKUTZ9bZNlY9ylRjoXuznAX1gvJXGFoWPBTHjSUpBMcG7H58vDkUCdQpg1LSmTYIw",
    "tokenType": "Bearer",
    "expiresIn": 31104000
  }
};