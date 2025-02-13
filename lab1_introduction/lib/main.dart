import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  int getRandomNumber() {
    return Random().nextInt(400);
  }

  buttonHandler(context) {
    return showDialog<String>(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // #1 Gebruik de correcte 'view' in een MaterialApp
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Instagrom Ⓡ'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 12),
              child: Column(
                children: [
                  SubTitle(
                    icon: Icons.hourglass_bottom,
                    text: 'Loading indicator',
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Theme.of(context).platform == TargetPlatform.android
                        ? CircularProgressIndicator(
                            color: Colors.orangeAccent,
                          )
                        : CupertinoActivityIndicator(
                            radius: 16,
                          ),
                  ),

                  SubTitle(
                    icon: Icons.ads_click,
                    text: 'A lil\' button',
                  ),
                  TextButton(
                    onPressed: () => buttonHandler(context),
                    child: Text(
                      'Click me!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // TODO: show a message when the button is clicked
                  SubTitle(
                    icon: Icons.image,
                    text: 'Random image!',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.network(
                              'https://picsum.photos/1000?image=${getRandomNumber()}',
                              // full screen width
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.contain, // For smaller images!
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.network(
                              'https://picsum.photos/1000?image=${getRandomNumber()}',
                              // full screen width
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SubTitle(
                    icon: Icons.brush,
                    text: 'Colors & theme',
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class SubTitle extends StatelessWidget {
  final IconData icon;
  final String text;

  const SubTitle({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(icon),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
