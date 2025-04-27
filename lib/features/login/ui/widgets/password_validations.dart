import 'package:flutter/material.dart';
import 'package:new_exp_flut/core/theming/spacing.dart';

import '../../../../core/theming/color.dart';
import '../../../../core/theming/style.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasNumber;
  final bool hasMinimumLength;

  const PasswordValidations({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacter,
    required this.hasNumber,
    required this.hasMinimumLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        _buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        _buildValidationRow('At least 1 special character', hasSpecialCharacter),
        verticalSpace(2),
        _buildValidationRow('At least 1 number', hasNumber),
        verticalSpace(2),
        _buildValidationRow('At least 8 characters', hasMinimumLength),
      ],
    );
  }

  Widget _buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(text, style:TextStyles.font13DarkBlueRegular.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough: null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
        )),
      ],
    );
  }
}
