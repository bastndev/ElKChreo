import 'package:flutter/material.dart';
import 'package:practice/core/themes/colors/my_color.dart';

const String negocioImagePath = 'assets/images/negocio.png';
const String empresaImagePath = 'assets/images/empresa.png';

class OptionalWidget extends StatefulWidget {
  const OptionalWidget({super.key});

  @override
  OptionalWidgetState createState() => OptionalWidgetState();
}

class OptionalWidgetState extends State<OptionalWidget> {
  String? selectedImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OptionalLine(),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image for the business
            BusinessBox(
              imagePath: negocioImagePath,
              isSelected: selectedImagePath == negocioImagePath,
              onTap: () {
                setState(() {
                  selectedImagePath = selectedImagePath == negocioImagePath
                      ? null
                      : negocioImagePath;
                });
              },
            ),
            const SizedBox(width: 20),
            // Image for the company
            BusinessBox(
              imagePath: empresaImagePath,
              isSelected: selectedImagePath == empresaImagePath,
              onTap: () {
                setState(() {
                  selectedImagePath = selectedImagePath == empresaImagePath
                      ? null
                      : empresaImagePath;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}

class OptionalLine extends StatelessWidget {
  const OptionalLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: MyColor.optionalLine,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Opcional',
              style: TextStyle(
                color: MyColor.optionalText,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              thickness: 0.5,
              color: MyColor.optionalLine,
            ),
          ),
        ],
      ),
    );
  }
}

class BusinessBox extends StatefulWidget {
  final String imagePath;
  final bool isSelected;
  final VoidCallback onTap;

  const BusinessBox({
    super.key,
    required this.imagePath,
    required this.isSelected,
    required this.onTap,
  });

  @override
  BusinessBoxState createState() => BusinessBoxState();
}

class BusinessBoxState extends State<BusinessBox> {
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
