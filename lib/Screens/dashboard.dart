import 'package:flutter/material.dart';
import 'package:testapp/Screens/history_screen.dart';
import 'package:testapp/Screens/live_monitoring_screen.dart';
import 'package:testapp/Screens/motor_control_screen.dart';
import 'package:testapp/Screens/notifications_screen.dart';

class TankDashboard extends StatefulWidget {
  const TankDashboard({super.key});

  @override
  State<TankDashboard> createState() => _TankDashboardState();
}

class _TankDashboardState extends State<TankDashboard> {
  int _selectedIndex = 0;

  void _onNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0: // Alerts
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const NotificationsScreen()),
        );
        break;

      case 1: // Motor
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MotorControlScreen()),
        );
        break;

      case 2: // Analytics
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const HistoryScreen()),
        );
        break;

      case 3: // Live
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const LiveMonitoringScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double boxHeight = 110;
    final double bigBoxHeight = 160;

    return Scaffold(
      backgroundColor: const Color(0xFF0D47A1),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavTap,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue.shade900,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Alerts",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.power_settings_new),
            label: "Motor",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: "Analytics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.waves),
            label: "Live",
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              /// Main Dashboard Card with summary
              dashboardCard(
                title: "Dashboard",
                height: bigBoxHeight,
                color: Colors.lightBlue.shade300,
                icon: Icons.dashboard_customize,
                subtitle: "Water Level: 78%\nMotor: ON",
                onTap: () {},
              ),
              const SizedBox(height: 18),

              /// Row 1
              Row(
                children: [
                  Expanded(
                    child: dashboardCard(
                      title: "Water Level",
                      height: boxHeight,
                      color: Colors.blue.shade400,
                      icon: Icons.opacity,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LiveMonitoringScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: dashboardCard(
                      title: "Daily / Monthly Usage",
                      height: boxHeight,
                      color: Colors.blue.shade400,
                      icon: Icons.history,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const HistoryScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              /// Row 2
              Row(
                children: [
                  Expanded(
                    child: dashboardCard(
                      title: "Motor Status",
                      height: boxHeight,
                      color: Colors.blue.shade400,
                      icon: Icons.power,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const MotorControlScreen()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: dashboardCard(
                      title: "Alert Status",
                      height: boxHeight,
                      color: Colors.blue.shade400,
                      icon: Icons.notifications_active,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NotificationsScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),

              /// History / Records
              dashboardCard(
                title: "History / Records",
                height: boxHeight,
                color: Colors.lightBlue.shade300,
                icon: Icons.insert_chart,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HistoryScreen()),
                  );
                },
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }

  /// Reusable Dashboard Card
  Widget dashboardCard({
    required String title,
    required double height,
    required Color color,
    required VoidCallback onTap,
    IconData? icon,
    String? subtitle,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: height,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.95),
              color.withOpacity(0.75),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 6,
              offset: const Offset(2, 4),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(icon, color: Colors.white, size: 36),
            if (icon != null) const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
