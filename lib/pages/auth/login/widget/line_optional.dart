import 'package:flutter/material.dart';

class ContinueLine extends StatelessWidget {
  const ContinueLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Opcional',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),
          const Expanded(
            child: Divider(
              thickness: 0.5,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
