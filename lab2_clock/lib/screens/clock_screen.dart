import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab2_clock/models/app_settings.dart';
import 'package:lab2_clock/screens/settings_screen.dart';
import 'package:lab2_clock/widgets/clock/background_text.dart';
import 'package:lab2_clock/widgets/clock/digital_clock.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  AppSettings _settings = AppSettings(
    clockStyle: 'digital',
    clockFormat: '12',
    themeColor: Colors.red,
    showFocusTimer: 'no',
  );

  @override
  Widget build(BuildContext context) {
    Future<void> openSettings() async {
      final AppSettings? newSettings = await Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => const SettingsScreen()));

      if (newSettings != null) {
        setState(() {
          _settings = newSettings;
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: BackgroundText(text: 'Focus'),
          ),
          Center(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child:
                        _settings.clockStyle == 'digital'
                            ? DigitalClock()
                            : Text('Analogue Clock'),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 48),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'You have been focused for 09 minutes and 12 seconds.',
                        ),

                        TextButton(
                          onPressed: () {
                            openSettings();
                          },
                          style: ButtonStyle(
                            overlayColor: WidgetStateProperty.all(
                              Colors.transparent,
                            ),
                          ),
                          child: Text(
                            'Settings',
                            style: GoogleFonts.inter(
                              color: Colors.grey[400],
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.grey[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
