// Auth Cubit: State Management

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vistara/features/auth/domain/entities/app_user.dart';
import 'package:vistara/features/auth/domain/repository/auth_repo.dart';
import 'package:vistara/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  // Check if user is authenticated
  void checkAuthStatus() async {
    final AppUser? user = await authRepo.getCurrentUser();
    if (user != null) {
      _currentUser = user;
      emit(AuthAuthenticated(user));
    } else {
      emit(AuthUnauthenticated());
    }
  }

  // Get Current User
  AppUser? getCurrentUser() {
    return _currentUser;
  }

  //Login with Email + Password
  Future<void> login(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailPassword(email, password);

      if (user != null) {
        _currentUser = user;
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthUnauthenticated());
    }
  }

  //Register with Email + Password
  Future<void> register(String name, String email, String password) async {
    try {
      emit(AuthLoading());

      final user = await authRepo.registerWithEmailPassword(name , email, password);

      if (user != null) {
        _currentUser = user;
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthUnauthenticated());
    }
  }

  //Logout
  Future<void> logout() async {
    try {
      emit(AuthLoading());
      await authRepo.logout();
      _currentUser = null;
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(AuthUnauthenticated());
    }
  }
}
