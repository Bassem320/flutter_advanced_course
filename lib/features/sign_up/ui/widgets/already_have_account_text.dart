import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:new_exp_flut/core/helpers/extensions.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/style.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Login',
            style: TextStyles.font13BlueSemibold,
            recognizer: TapGestureRecognizer()
              ..onTap = (){
              context.pushReplacementNamed(Routes.loginScreen);
          }
          ),
        ],
      ),
    );
  }
}
