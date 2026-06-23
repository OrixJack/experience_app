import 'package:experience_app/features/users/data/data_sources/login_data_source.dart';
import 'package:experience_app/features/users/data/models/user_login_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseLoginDataSource implements LoginDataSource {
  FirebaseLoginDataSource({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  @override
  Future<UserCredential> loginWithEmailAndPassword(
    UserLoginModel loginModel,
  ) async {
    try {
      final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
      return response;
    } on FirebaseAuthException catch (e) {
      throw Exception(_mapFirebaseError(e));
    } catch (e) {
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  String _mapFirebaseError(FirebaseAuthException error) {
    print('FirebaseAuthException: ${error.code} - ${error.message}');
    switch (error.code) {
      case 'user-not-found':
        return 'No account found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'invalid-email':
        return 'Please enter a valid email address.';
      case 'user-disabled':
        return 'This account has been disabled.';
      case 'too-many-requests':
        return 'Too many login attempts. Please try again later.';
      case 'network-request-failed':
        return 'Network connection failed. Please check your internet connection.';
      default:
        return error.message ?? 'Login failed. Please try again.';
    }
  }
}
