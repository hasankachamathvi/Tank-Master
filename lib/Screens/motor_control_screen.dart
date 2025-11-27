import 'package:flutter/material.dart';

class MotorControlScreen extends StatefulWidget {
  const MotorControlScreen({super.key});

  @override
  State<MotorControlScreen> createState() => _MotorControlScreenState();
}

class _MotorControlScreenState extends State<MotorControlScreen> {
  bool motorStatus = false; // false = OFF

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Motor Control",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [

            /// 🔹 STATUS BOX
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Icon(
                    motorStatus ? Icons.power : Icons.power_off,
                    color: motorStatus ? Colors.green : Colors.red,
                    size: 70,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    motorStatus ? "Motor is ON" : "Motor is OFF",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: motorStatus ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            /// 🔹 SWITCH CONTROL
            SwitchListTile(
              value: motorStatus,
              title: const Text(
                "Power Control",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
              ),
              onChanged: (value) {
                setState(() {
                  motorStatus = value;
                });
              },
            ),

            const SizedBox(height: 20),

            /// 🔹 BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: motorStatus
                      ? null
                      : () {
                          setState(() => motorStatus = true);
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  ),
                  child: const Text(
                    "Turn ON",
                    style: TextStyle(fontSize: 16),
                  ),
                ),

                ElevatedButton(
                  onPressed: motorStatus
                      ? () {
                          setState(() => motorStatus = false);
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  ),
                  child: const Text(
                    "Turn OFF",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
