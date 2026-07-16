import 'package:flutter/material.dart';

import '../01_splash_screen/splash_page.dart';
import '../10_user_login/usuario_login/login_01_login_page.dart';
import '../10_user_login/usuario_login/login_02_register_page.dart';
import '../41_connectivity/pagina_sin_coneccion.dart';
import '../60_global_widgets/debugprint.dart';
import '../../../features/diet_tracking/ui/dashboard/dashboard_screen.dart';
import '../../../features/diet_tracking/ui/targets/targets_screen.dart';
import '../../../features/diet_tracking/ui/daily_capture/daily_capture_screen.dart';
import '../../../features/diet_tracking/ui/daily_capture/consumed_foods_screen.dart';
import '../../../features/diet_tracking/ui/food_catalog/personal_foods_screen.dart';

class AppRoutes {
  static const main = "/";
  static const splash = "/splash";
  static const login = "/login";
  static const register = "/register";
  static const sinconeccion = "/sinconeccion";
  static const dashboard = "/dashboard";
  static const targets = "/targets";
  static const dailyCapture = "/dailyCapture";
  static const consumedFoods = "/consumedFoods";
  static const personalFoods = "/personalFoods";
}

MaterialPageRoute navigateToRoute(
  Widget screen, {
  required RouteSettings settings,
}) {
  debugPrintLevels(2, "AppRoutes navigateToRoute: ${settings.name}");
  return MaterialPageRoute(
    settings: settings,
    builder: (BuildContext context) {
      return screen;
    },
  );
}

Route? routeGenerate(RouteSettings settings) {
  debugPrintLevels(1, "routeGenerate RouteSettings: ${settings.name}");
  debugPrintLevels(1, "routeGenerate settings: ${settings.arguments}");

  switch (settings.name) {
    case AppRoutes.main:
    case AppRoutes.splash:
      return navigateToRoute(
        const SplashPage(duration: 3),
        settings: settings,
      );

    case AppRoutes.sinconeccion:
      return navigateToRoute(
        PaginaSinConeccion(settings.arguments as String),
        settings: settings,
      );

    case AppRoutes.login:
      return navigateToRoute(const LoginPage(), settings: settings);

    case AppRoutes.register:
      return navigateToRoute(const RegisterPage(), settings: settings);

    case AppRoutes.dashboard:
      return navigateToRoute(const DashboardScreen(), settings: settings);

    case AppRoutes.targets:
      return navigateToRoute(const TargetsScreen(), settings: settings);

    case AppRoutes.dailyCapture:
      return navigateToRoute(
        DailyCaptureScreen(date: settings.arguments as DateTime),
        settings: settings,
      );

    case AppRoutes.consumedFoods:
      return navigateToRoute(
        ConsumedFoodsScreen(date: settings.arguments as DateTime),
        settings: settings,
      );

    case AppRoutes.personalFoods:
      return navigateToRoute(
        const PersonalFoodsScreen(),
        settings: settings,
      );

    default:
      return null;
  }
}
