import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../07_routes/app_routes.dart';
import '../../20_var_globales/app_keys.dart';
import '../../20_var_globales/var_color_themes.dart';
import '../../20_var_globales/variables_globales.dart';
import '../../40_security/generate_hash.dart';
import '../../60_global_widgets/debugprint.dart';
import 'provider_session.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  bool _isLoading = false;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    debugPrintLevels(12, " LoginPage _handleLogin");

    if (usernameController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Escriba usuario y contraseña"),
          backgroundColor: appTheme.error,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    FocusScope.of(context).unfocus();

    try {
      final sessionNotifier = ref.read(sessionProvider.notifier);
      final username = usernameController.text.trim();
      final password = passwordController.text.trim();

      ref
          .read(sessionProvider.notifier)
          .setSessionVarValue("userName", username);
      ref
          .read(sessionProvider.notifier)
          .setSessionVarValue("userPass", password);

      final onValue = await sessionNotifier.getUserIdNamePassByName();

      if (!mounted) return;

      if (onValue != 200) {
        await showDialog(
          context: context,
          builder: (dialogContext) => AlertDialog(
            backgroundColor: appTheme.error,
            title: const Text(
              "Error de Ingreso",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              "Usuario o contraseña incorrectos.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text(
                  "Intentar de nuevo",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      } else {
        await sessionNotifier.getUserDataByNameInSessionData();

        await sessionNotifier.saveVarValueToLocalStorage(
          "userId",
          ref.read(sessionProvider).sessionUserData.userId,
        );
        await sessionNotifier.saveVarValueToLocalStorage(
          "userName",
          ref.read(sessionProvider).sessionUserData.userName,
        );
        await sessionNotifier.saveVarValueToLocalStorage(
          "userPassHash",
          generateSHA256Hash(passwordController.text.trim()),
        );

        if (mounted) Navigator.of(context).pushReplacementNamed('/dashboard');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error inesperado: $e"),
            backgroundColor: appTheme.error,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    auth = ref.watch(sessionProvider);
    final isLoggedIn = auth.isAuthenticated == true && auth.userId != null;

    return Scaffold(
      backgroundColor: appTheme.surface,
      appBar: AppBar(
        backgroundColor: appTheme.surface,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Regresar',
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancelar',
              style: TextStyle(color: appTheme.onSurface),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              reverse: false,
              padding: const EdgeInsets.all(20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: AutofillGroup(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'ComoSano',
                        style: TextStyle(
                          color: appTheme.primary,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 30),
                      if (isLoggedIn) ...[
                        Text(
                          'Sesión activa: ${auth.sessionUserData.userName}',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/dashboard');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appTheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Ir al Dashboard',
                              style: TextStyle(
                                color: appTheme.onPrimary,
                                fontSize: tamanoLetra,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () async {
                              final notifier =
                                  ref.read(sessionProvider.notifier);
                              await notifier.deleteLocalSessionData();
                              if (!mounted) return;
                              notifier.resetInitialUserData(0);
                              if (!mounted) return;
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Sesión cerrada')),
                              );
                              Navigator.of(context)
                                  .pushReplacementNamed('/login');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: appTheme.error,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              'Cerrar sesión',
                              style: TextStyle(
                                color: appTheme.onPrimary,
                                fontSize: tamanoLetra,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ] else
                        ..._buildLoginForm(context),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildLoginForm(BuildContext context) {
    return [
      TextField(
        controller: usernameController,
        decoration: InputDecoration(
          hintText: 'Nombre de usuario',
          prefixIcon: const Icon(Icons.person),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: appTheme.surfaceContainerHighest,
          filled: true,
        ),
      ),
      const SizedBox(height: 15),
      TextField(
        controller: passwordController,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Clave de acceso',
          prefixIcon: const Icon(Icons.lock),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: appTheme.surfaceContainerHighest,
          filled: true,
        ),
      ),
      const SizedBox(height: 30),
      _isLoading
          ? const CircularProgressIndicator()
          : SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: appTheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Entrar",
                  style: TextStyle(
                    color: appTheme.onPrimary,
                    fontSize: tamanoLetra,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
      const SizedBox(height: 20),
      TextButton(
        onPressed: () {
          Navigator.pushNamed(context, '/register');
        },
        child: Text(
          '¿No tienes cuenta? Regístrate',
          style: TextStyle(color: appTheme.primary),
        ),
      ),
    ];
  }
}
