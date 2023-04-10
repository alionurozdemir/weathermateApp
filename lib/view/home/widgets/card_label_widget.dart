import 'package:flutter/material.dart';

class CardLabel extends StatelessWidget {
  const CardLabel({required this.imagePath, required this.text, required this.data, super.key});
  final String imagePath;
  final String text;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        20,
        7,
        20,
        7,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 60,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(data, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(color: Colors.black, height: 1),
        ],
      ),
    );
  }
}
