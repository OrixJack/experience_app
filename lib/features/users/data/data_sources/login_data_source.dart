import 'package:experience_app/features/users/data/models/user_login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginDataSource {
  LoginDataSource();

  Future<UserCredential> loginWithEmailAndPassword(UserLoginModel loginModel);
}
