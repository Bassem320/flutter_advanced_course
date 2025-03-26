import 'package:flutter/material.dart';
import 'package:new_exp_flut/features/login/ui/screens/login_screen.dart';

import '../../features/onboarding/onboarding_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // this arguments to be passed in any screen like this
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
            body: Center(
              child: Text('No route  defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
