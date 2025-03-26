import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_exp_flut/core/theming/style.dart';
import 'package:new_exp_flut/features/onboarding/widgets/doctor_image_and_text.dart';
import 'package:new_exp_flut/features/onboarding/widgets/get_started_button.dart';

import 'widgets/doc_logo_and_name.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                DocLogoAndName(),
                SizedBox(height: 30.h),
                const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        textAlign: TextAlign.center,
                        style: TextStyles.font13GrayRegular,
                      ),
                      SizedBox(height: 30.h),
                      const GetStartedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
