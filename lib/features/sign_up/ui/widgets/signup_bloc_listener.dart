import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/style.dart';
import '../../logic/sign_up_cubit.dart';
import '../../logic/sign_up_state.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen:
          (previous, current) =>
              current is SignupLoading || current is SignupSuccess || current is SignupError,
      listener: (context, state) {
        switch (state) {
          case SignupLoading():
            // Show loading indicator
            showDialog(
              context: context,
              barrierDismissible: false,
              builder:
                  (context) => const Center(child: CircularProgressIndicator()),
            );
            break;
          case SignupSuccess(data: final signupResponse):
            _setupSignupSuccessfully(context);
            break;
          case SignupError(error: final error):
            _setupErrorState(context, error);
            break;
          default:
            break;
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  void _setupSignupSuccessfully(BuildContext context) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              "Signup Successfully",
              style: TextStyles.font24BlackBold,
            ),
            content: Text(
              "Congratulations, you have signed up successfully!",
              style: TextStyles.font15DarkBlueMedium,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  context.pushReplacementNamed(Routes.loginScreen);
                },
                child: Text(
                  'Continue',
                  style: TextStyles.font14BlueSemiBold,
                ),
              ),
            ],
          ),
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
