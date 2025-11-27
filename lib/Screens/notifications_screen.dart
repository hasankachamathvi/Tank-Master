import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Notifications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _buildNotificationTile(
            msg: "Tank Full",
            time: "2 min ago",
            icon: Icons.check_circle,
            iconColor: Colors.green,
          ),
          _buildNotificationTile(
            msg: "Water Level Low",
            time: "10 min ago",
            icon: Icons.warning_amber_rounded,
            iconColor: Colors.red,
          ),
          _buildNotificationTile(
            msg: "Motor Automatically Turned OFF",
            time: "Today, 08:50 AM",
            icon: Icons.power_settings_new,
            iconColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  /// ✅ Custom Notification Tile Widget
  Widget _buildNotificationTile({
    required String msg,
    required String time,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 32,
            color: iconColor,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  msg,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
