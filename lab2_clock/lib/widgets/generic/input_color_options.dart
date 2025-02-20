import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputColorOptions extends StatefulWidget {
  final List<Color> colors;
  final Color selectedColor;
  final void Function(Color) onColorSelected;

  const InputColorOptions({
    super.key,
    required this.colors,
    required this.selectedColor,
    required this.onColorSelected,
  });

  @override
  State<InputColorOptions> createState() => _InputColorOptionsState();
}

class _InputColorOptionsState extends State<InputColorOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Wrap(
        spacing: 16,
        children:
            widget.colors.map((color) {
              return TextButton(
                onPressed: () {
                  print('Choosing color');
                  setState(() {
                    widget.onColorSelected(color);
                  });
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                ),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      width: 8,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color:
                          widget.selectedColor == color
                              ? color.withAlpha(30)
                              : Colors.transparent,
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
