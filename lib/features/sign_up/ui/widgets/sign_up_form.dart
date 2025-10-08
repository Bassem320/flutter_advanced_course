import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_exp_flut/features/login/ui/widgets/password_validations.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/theming/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/sign_up_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinimumLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    passwordController = context.read<SignupCubit>().passwordController;
    _setupPasswordControllerListener();
  }

  void _setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinimumLength = AppRegex.hasMinimumLength(passwordController.text);
      });
    },);
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              } else {
                return null;
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              } else {
                return null;
              }
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Phone Number',
            validator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              } else {
                return null;
              }
            },
            controller: context.read<SignupCubit>().phoneController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),

            validator: (value){
              if (value == null || value.isEmpty || !AppRegex.isPasswordValid(value)) {
                return 'Please enter a valid password';
              }else {
                return null;
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Password',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText = !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText ? Icons.visibility : Icons.visibility_off,
              ),
            ),

            validator: (value){
              if (value == null || value.isEmpty || value != passwordController.text) {
                return 'Passwords do not match';
              }else {
                return null;
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinimumLength: hasMinimumLength,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.removeListener(() {});
    passwordController.dispose();
    context.read<SignupCubit>().emailController.dispose();
    super.dispose();
  }
}
