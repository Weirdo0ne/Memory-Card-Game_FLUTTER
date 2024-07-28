// ignore: unused_import
import 'package:concentration/global/global.dart';
import 'package:concentration/widgets/main_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color buttonColor; // Add buttonColor property

  const MainButton({
    Key? key,
    required this.title,
    required this.onTap,
    required this.buttonColor, // Update constructor to accept buttonColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor, // Use buttonColor here
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // Use Stack for layering
        children: [
          // Background image (place your image asset path here)
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/background/background.jpeg'), // Replace with your asset path
                fit: BoxFit.cover, // Adjust fit as needed (cover, fill, etc.)
              ),
            ),
          ),
          Padding(
            // Content padding
            padding: const EdgeInsets.symmetric(horizontal: 27.0),
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'BuildBrain',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
                          .displaySmall!
                          .copyWith(
                            color: Colors.black87,
                            fontFamily: 'Nicolast',
                            fontSize: 50,
                          ),
                    ),
                    const SizedBox(height: 10), // Added some spacing
                    Text(
                      'a game of memory',
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Color(0xffebd509), // Yellow color
                                fontFamily: 'Dimsum Week', // Maintain the font
                              ),
                    ),
                    const SizedBox(height: 127),
                    MainButton(
                      title: 'New Game',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        Navigator.pushNamed(context, '/newGame');
                      },
                      buttonColor: Colors.green, // Change button color here
                    ),
                    const SizedBox(height: 20),
                    Visibility(
                      visible: !kIsWeb,
                      child: MainButton(
                        title: 'Stats',
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          Navigator.pushNamed(context, '/stats');
                        },
                        buttonColor: Colors.blue, // Change button color here
                      ),
                    ),
                    const SizedBox(height: 20),
                    MainButton(
                      title: 'Credits',
                      onTap: () {
                        HapticFeedback.mediumImpact();
                        Navigator.pushNamed(context, '/credits');
                      },
                      buttonColor: Colors.red, // Change button color here
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
