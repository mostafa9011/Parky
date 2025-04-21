import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parky/core/helpers/cache_helper.dart';
import 'package:parky/features/auth/data/models/token_model.dart';
import 'package:parky/features/auth/data/repository/auth_repository.dart';

import '../../data/models/login_model.dart';
import '../../data/models/register_form.dart';
import '../../data/models/register_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);

  final AuthRepository _authRepository = AuthRepository();
  TokenModel? tokenModel;
  RegisterForm registerForm = RegisterForm();
  // login
  Future<void> login(LoginModel loginModel) async {
    emit(LoginLoading());
    final result = await _authRepository.login(loginModel);
    result.fold((failure) => emit(LoginError(failure.message)), (token) {
      tokenModel = token;
      CacheHelper.set(key: 'token', value: token.accessToken);
      emit(LoginSuccess());
    });
  }

  // register
  Future<void> register(RegisterModel registerModel) async {
    emit(RegisterLoading());
    final result = await _authRepository.register(registerModel);
    result.fold(
      (failure) => emit(RegisterError(failure.message)),
      (empty) => emit(RegisterSuccess()),
    );
    registerForm.clear();
  }
}
