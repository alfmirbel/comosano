import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core_backend_services/07_routes/app_routes.dart';
import '../../providers/daily_log_notifier.dart';
import '../../providers/target_points_notifier.dart';
import 'package:comosano/core_backend_services/20_var_globales/var_color_themes.dart';
import 'package:comosano/core_backend_services/20_var_globales/variables_globales.dart';
import 'package:comosano/core_backend_services/60_global_widgets/user_avatar_icon.dart';
import '../../../../core_backend_services/10_user_login/usuario_login/provider_session.dart';

class DashboardScreen extends ConsumerStatefulWidget {
  const DashboardScreen({super.key});

  @override
  ConsumerState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<DashboardScreen> {
  DateTime _currentMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(sessionProvider);
    // Si no hay metas establecidas, forzamos la asignación de metas.
    // Esto se chequea cuando se presiona un día, pero también podemos mostrar un aviso.
    final targetPoints = ref.watch(targetPointsProvider);
    final hasTargets = targetPoints.slotsPerCategory.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendario de Dieta"),
        actions: [
          const UserAvatarIcon(),
          if (auth.isAuthenticated == true)
            IconButton(
              icon: const Icon(Icons.inventory_2),
              tooltip: "Mis alimentos",
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.personalFoods);
              },
            ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: "Configurar Metas",
            onPressed: () {
              Navigator.pushNamed(context, "/targets");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (!hasTargets)
            Container(
              padding: const EdgeInsets.all(16),
              color: appTheme.tertiaryContainer,
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded, color: appTheme.tertiary),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Aún no tienes metas asignadas. Toca el engrane para configurarlas antes de iniciar.",
                      style: TextStyle(color: appTheme.error),
                    ),
                  ),
                ],
              ),
            ),
          _buildMonthSelector(),
          Expanded(child: _buildCalendarGrid()),
        ],
      ),
    );
  }

  Widget _buildMonthSelector() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setState(() {
                _currentMonth = DateTime(
                  _currentMonth.year,
                  _currentMonth.month - 1,
                  1,
                );
              });
            },
          ),
          Text(
            DateFormat.yMMMM('es').format(_currentMonth).toUpperCase(),
            style: TextStyle(
              fontSize: fontSizeTituloPagina,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setState(() {
                _currentMonth = DateTime(
                  _currentMonth.year,
                  _currentMonth.month + 1,
                  1,
                );
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    final daysInMonth = DateUtils.getDaysInMonth(
      _currentMonth.year,
      _currentMonth.month,
    );
    final firstDayOffset =
        DateTime(_currentMonth.year, _currentMonth.month, 1).weekday % 7;

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: daysInMonth + firstDayOffset,
      itemBuilder: (context, index) {
        if (index < firstDayOffset) {
          return const SizedBox.shrink();
        }
        final day = index - firstDayOffset + 1;
        final date = DateTime(_currentMonth.year, _currentMonth.month, day);
        return _DayCell(date: date);
      },
    );
  }
}

class _DayCell extends ConsumerWidget {
  final DateTime date;

  const _DayCell({required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escucha el estado diario para esta fecha específica
    final dailyLog = ref.watch(dailyLogProvider(date));
    final percentage = dailyLog.totalPercentage;

    Color cellColor;
    if (percentage == 0) {
      cellColor = Colors.grey.shade200; // Sin datos
    } else if (percentage < 100) {
      cellColor = Colors.yellow.shade300; // < 100% Amarillo
    } else if (percentage == 100) {
      cellColor = Colors.green.shade300; // == 100% Verde
    } else {
      cellColor = Colors.red.shade300; // > 100% Rojo
    }

    return GestureDetector(
      onTap: () {
        final targetPoints = ref.read(targetPointsProvider);
        if (targetPoints.slotsPerCategory.isEmpty) {
          // Redirección forzada
          Navigator.pushNamed(context, "/targets");
        } else {
          // Entrar a captura diaria
          Navigator.pushNamed(context, "/dailyCapture", arguments: date);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: cellColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: appTheme.outlineVariant),
        ),
        child: Center(
          child: Text(
            "${date.day}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
