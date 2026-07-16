import 'package:comosano/core_backend_services/01_splash_screen/splash_page.dart';
import 'package:comosano/core_backend_services/10_user_login/data_models/auth_state.dart';
import 'package:comosano/core_backend_services/60_global_widgets/debugprint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

import 'core_backend_services/07_routes/app_routes.dart';
import 'core_backend_services/20_var_globales/app_keys.dart';
import 'core_backend_services/20_var_globales/var_color_themes.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core_backend_services/10_user_login/usuario_login/provider_session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es', null);

  setPathUrlStrategy();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(sessionProvider.notifier).getSessionValuesFromLocalStorage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comosano Diet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: appTheme),
      initialRoute: AppRoutes.dashboard,
      onGenerateRoute: routeGenerate,
    );
  }
}
