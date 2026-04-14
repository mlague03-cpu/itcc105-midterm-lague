import 'package:flutter/material.dart';
import 'copilot_engine.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showResponse(BuildContext context, String intent) {
    final response = CopilotEngine.getResponse(intent);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(response),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const primaryPurple = Color(0xFF6A1B9A);

    return Scaffold(
      backgroundColor: const Color(0xFFF6F1FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              const Text(
                "🎓 ASSCAT AI COPILOT",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: primaryPurple,
                ),
              ),

              const SizedBox(height: 10),
              const Divider(thickness: 2),

              const SizedBox(height: 30),

              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryPurple.withOpacity(0.1),
                ),
                child: const Icon(
                  Icons.mic,
                  size: 50,
                  color: primaryPurple,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "What do you need?",
                style: TextStyle(fontSize: 18),
              ),

              const SizedBox(height: 30),

              // BUTTONS (NOW CONNECTED 🔥)
              customButton(context, "💰 Check my payment", primaryPurple),
              const SizedBox(height: 15),
              customButton(context, "📅 Show my schedule", primaryPurple),
              const SizedBox(height: 15),
              customButton(context, "📋 Enrollment help", primaryPurple),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "[ Tap to speak or type ]",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'Try: "check payment"',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton(BuildContext context, String text, Color color) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          showResponse(context, text);
        },
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14),
          side: BorderSide(color: color),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
