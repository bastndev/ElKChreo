import 'package:flutter/material.dart';
import 'package:practice/core/themes/colors/my_color.dart';

class OptionalWidget extends StatefulWidget {
  const OptionalWidget({super.key});

  @override
  _OptionalWidgetState createState() => _OptionalWidgetState();
}

class _OptionalWidgetState extends State<OptionalWidget> {
  String? selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ContinueLine(),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareTile(
              imagePath: 'assets/images/negocio.png',
              isSelected: selectedImagePath == 'assets/images/negocio.png',
              onTap: () {
                setState(() {
                  selectedImagePath =
                      selectedImagePath == 'assets/images/negocio.png'
                          ? null
                          : 'assets/images/negocio.png';
                });
              },
            ),
            const SizedBox(width: 20),
            SquareTile(
              imagePath: 'assets/images/empresa.png',
              isSelected: selectedImagePath == 'assets/images/empresa.png',
              onTap: () {
                setState(() {
                  selectedImagePath =
                      selectedImagePath == 'assets/images/empresa.png'
                          ? null
                          : 'assets/images/empresa.png';
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

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

class SquareTile extends StatefulWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const SquareTile({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  SquareTileState createState() => SquareTileState();
}

class SquareTileState extends State<SquareTile> {
  Color get backgroundColor =>
      widget.isSelected ? MyColor.mainButton : MyColor.secondButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(13),
        ),
        child: Image.asset(
          widget.imagePath,
          height: 30,
        ),
      ),
    );
  }
}
