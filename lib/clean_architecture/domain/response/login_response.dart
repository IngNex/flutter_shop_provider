import 'package:flutter_apptesis/clean_architecture/domain/model/user_modal.dart';

class LoginResponse {
  final String token;
  final User user;
  const LoginResponse({
    required this.token,
    required this.user,
  });
}
