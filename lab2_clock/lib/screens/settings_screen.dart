import 'package:flutter/material.dart';
import 'package:lab2_clock/models/app_settings.dart';
import 'package:lab2_clock/widgets/generic/input_color_options.dart';
import 'package:lab2_clock/widgets/generic/input_label.dart';
import 'package:lab2_clock/widgets/generic/input_text_options.dart';
import 'package:lab2_clock/widgets/generic/large_text.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final AppSettings _appSettings = AppSettings(
    clockStyle: 'digital',
    clockFormat: '12',
    themeColor: Colors.red,
    showFocusTimer: 'no',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64)),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              right: 40,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop(_appSettings);
                },
                icon: Icon(Icons.close),
              ),
            ),
            Center(
              child: Column(
                children: [
                  const LargeText(text: 'Settings'),
                  const InputLabel(text: 'Clock style '),
                  InputTextOptions(
                    options: [
                      {'label': 'Analog', "value": 'analog'},
                      {'label': 'Digital', 'value': "digital"},
                    ],
                    selectedOption: _appSettings.clockStyle,
                    onOptionSelected: (newOption) {
                      print('NEW OPTION: $newOption');
                      setState(() {
                        _appSettings.clockStyle = newOption;
                      });
                    },
                  ),

                  const InputLabel(text: 'Clock format'),
                  InputTextOptions(
                    options: [
                      {'label': 'AM/PM', "value": '12'},
                      {'label': 'European', 'value': "24"},
                    ],
                    selectedOption: _appSettings.clockFormat,
                    onOptionSelected: (newOption) {
                      print('NEW OPTION: $newOption');
                      setState(() {
                        _appSettings.clockFormat = newOption;
                      });
                    },
                  ),

                  const InputLabel(text: 'Show focus timer'),
                  InputTextOptions(
                    options: [
                      {'label': 'Sure', "value": 'yes'},
                      {'label': 'Nope', 'value': "no"},
                    ],
                    selectedOption: _appSettings.showFocusTimer,
                    onOptionSelected: (newOption) {
                      print('NEW OPTION: $newOption');
                      setState(() {
                        _appSettings.showFocusTimer = newOption;
                      });
                    },
                  ),

                  const InputLabel(text: 'Pick a color'),
                  InputColorOptions(
                    colors: [
                      Colors.yellow,
                      Colors.blue,
                      Colors.red,
                      Colors.cyan,
                      Colors.green,
                    ],
                    selectedColor: _appSettings.themeColor,
                    onColorSelected: (newColor) {
                      print('NEW COLOR: $newColor');
                      setState(() {
                        _appSettings.themeColor = newColor;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
