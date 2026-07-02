import 'package:experience_app/features/users/data/data_sources/firebase_login_data_source.dart';
import 'package:experience_app/features/users/data/data_sources/login_data_source.dart';
import 'package:experience_app/features/users/data/models/user_login_model.dart';
import 'package:experience_app/features/users/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl() : super();

  final LoginDataSource _loginDataSource = FirebaseLoginDataSource();

  @override
  Future<bool> loginWithEmailAndPassword(UserLoginModel loginModel) async {
    try {
      if (loginModel.email.isNotEmpty && loginModel.password.isNotEmpty) {
        await _loginDataSource.loginWithEmailAndPassword(loginModel);
        return true;
      } else {
        throw Exception('Please enter email and password');
      }
    } catch (e) {
      rethrow;
    }
  }
}
