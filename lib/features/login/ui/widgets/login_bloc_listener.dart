import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_exp_flut/core/helpers/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/style.dart';
import '../../logic/cubits/login_cubit.dart';
import '../../logic/cubits/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen:
          (previous, current) =>
              current is Loading || current is LoginSuccess || current is LoginError,
      listener: (context, state) {
        switch (state) {
          case Loading():
            // Show loading indicator
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => const Center(child: CircularProgressIndicator()),
            );
            break;
          case LoginSuccess(data: final loginResponse):
            context.pop();
            context.pushNamed(Routes.homeScreen);
            break;
          case LoginError(error: final error):
            _setupErrorState(context, error);
            break;
          default:
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void _setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: const Icon(Icons.error, color: Colors.red, size: 32),
            content: Text(
              error,
              style: TextStyles.font15DarkBlueMedium,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: Text(
                  'Got it',
                  style: TextStyles.font14BlueSemiBold,
                ),
              ),
            ],
          ),
    );
  }
}
