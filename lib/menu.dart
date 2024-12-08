import 'package:flutter/material.dart';
import 'entrainements.dart';
import 'dietetique.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // First Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EntrainementsPage()),
                );
              },
              child: AnimatedButton(
                text: "Commencer\nL'entraînement",
                initialGradient: LinearGradient(
                  colors: [Colors.green, Colors.lightGreenAccent],
                ),
                onTapGradient: LinearGradient(
                  colors: [Colors.blue, Colors.blueAccent],
                ),
              ),
            ),
            SizedBox(height: 32), // Space between buttons
            // Second Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DietetiquePage()),
                );
              },
              child: AnimatedButton(
                text: "Commencer\nMa diététique",
                initialGradient: LinearGradient(
                  colors: [Colors.green, Colors.lightGreenAccent],
                ),
                onTapGradient: LinearGradient(
                  colors: [Colors.blue, Colors.blueAccent],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final String text;
  final LinearGradient initialGradient;
  final LinearGradient onTapGradient;

  const AnimatedButton({
    required this.text,
    required this.initialGradient,
    required this.onTapGradient,
  });

  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isTapped = true);
      },
      onTapUp: (_) {
        setState(() => _isTapped = false);
      },
      onTapCancel: () {
        setState(() => _isTapped = false);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          gradient: _isTapped ? widget.onTapGradient : widget.initialGradient,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}




