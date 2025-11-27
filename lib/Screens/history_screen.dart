import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Usage History",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          _buildHistoryCard(
            date: "Nov 10, 2025",
            usage: "120 L",
            icon: Icons.calendar_today,
          ),
          _buildHistoryCard(
            date: "Nov 09, 2025",
            usage: "145 L",
            icon: Icons.calendar_today,
          ),
          _buildHistoryCard(
            date: "Nov 08, 2025",
            usage: "140 L",
            icon: Icons.calendar_today,
          ),
          const SizedBox(height: 10),

          _buildMonthSection("Monthly Usage"),
          _buildHistoryCard(
            date: "November",
            usage: "3800 L",
            icon: Icons.water_drop,
          ),
          _buildHistoryCard(
            date: "October",
            usage: "4100 L",
            icon: Icons.water_drop,
          ),
        ],
      ),
    );
  }

  /// ✅ SECTION LABEL
  Widget _buildMonthSection(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  /// ✅ Single History Card
  Widget _buildHistoryCard({
    required String date,
    required String usage,
    required IconData icon,
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
            size: 30,
            color: Colors.blue,
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Text(
              date,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Text(
            usage,
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
