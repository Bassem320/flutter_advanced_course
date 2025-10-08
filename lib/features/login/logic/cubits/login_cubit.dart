import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_exp_flut/features/login/data/repo/login_repo.dart';

import 'package:new_exp_flut/core/networking/api_result.dart';

import '../../data/models/login_request_body.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    switch (response) {
      case Success(data: final data):
        emit(LoginState.success(data));
      case Failure(error: final error):
        emit(LoginState.error(error: error.apiErrorModel.message!));
    }
  }
}
