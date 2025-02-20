import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextOptions extends StatefulWidget {
  final List<Map<String, String>> options;
  final String selectedOption;
  final void Function(String) onOptionSelected;

  const InputTextOptions({
    super.key,
    required this.options,
    required this.selectedOption,
    required this.onOptionSelected,
  });

  @override
  State<InputTextOptions> createState() => _InputTextOptionsState();
}

class _InputTextOptionsState extends State<InputTextOptions> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        spacing: 16,
        children:
            widget.options.map((option) {
              return Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {
                    print('Choosing option');
                    setState(() {
                      widget.onOptionSelected(option['value']!);
                    });
                  },
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    alignment:
                        widget.options.indexOf(option) == 0
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                  ),
                  child: Text(
                    '${option['label']}',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color:
                          widget.selectedOption == option['value']
                              ? Colors.black
                              : Colors.grey[300],
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
