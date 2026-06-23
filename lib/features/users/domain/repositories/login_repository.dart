import 'package:experience_app/features/users/data/models/user_login_model.dart';

abstract class LoginRepository {
  Future<bool> loginWithEmailAndPassword(UserLoginModel loginModel);
}
