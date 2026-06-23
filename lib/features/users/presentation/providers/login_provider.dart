import 'package:experience_app/core/local_storage.dart';
import 'package:experience_app/features/users/data/models/user_login_model.dart';
import 'package:experience_app/features/users/data/repositories/login_repository_impl.dart';
import 'package:experience_app/features/users/presentation/states/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginProvider extends StateNotifier<LoginState> {
  final LocalStorage _localStorage;

  LoginProvider(this._localStorage) : super(const LoginState());

  void setEmail(String email) {
    state = state.copyWith(email: email, errorMessage: '');
  }

  void setPassword(String password) {
    state = state.copyWith(password: password, errorMessage: '');
  }

  /// Carga la sesión existente desde local storage
  Future<void> loadSavedSession() async {
    final session = await _localStorage.getSession();
    if (session != null) {
      state = state.copyWith(email: session['email'] ?? '', isLoggedIn: true);
    }
  }

  Future<bool> loginWithEmailAndPassword() async {
    if (state.email.isEmpty || state.password.isEmpty) {
      state = state.copyWith(errorMessage: 'Please enter email and password');
      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: '');

    try {
      final loginRepository = LoginRepositoryImpl();
      final success = await loginRepository.loginWithEmailAndPassword(
        UserLoginModel(email: state.email, password: state.password),
      );

      if (success) {
        // Get current user to get userId
        final currentUser = FirebaseAuth.instance.currentUser;
        if (currentUser != null) {
          // Save session to local storage
          await _localStorage.saveSession(
            email: state.email,
            userId: currentUser.uid,
          );
        }

        state = state.copyWith(
          isLoading: false,
          isLoggedIn: true,
          errorMessage: '',
        );
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          isLoggedIn: false,
          errorMessage: 'Login failed. Please check your credentials.',
        );
        return false;
      }
    } catch (e) {
      String errorMessage = 'Login failed. Please try again.';
      if (e is Exception) {
        errorMessage = e.toString().replaceAll('Exception: ', '');
      }
      state = state.copyWith(isLoading: false, errorMessage: errorMessage);
      return false;
    }
  }

  /// Cierra la sesión y limpia el local storage
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _localStorage.clearSession();
      state = const LoginState();
    } catch (e) {
      state = state.copyWith(errorMessage: 'Logout failed. Please try again.');
    }
  }
}

final loginProvider = StateNotifierProvider<LoginProvider, LoginState>((ref) {
  return LoginProvider(LocalStorage());
});
