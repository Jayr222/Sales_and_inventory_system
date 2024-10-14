import 'package:flutter/material.dart';

class IntroAnimation extends StatefulWidget {
  const IntroAnimation({super.key});

  @override
  IntroAnimationState createState() => IntroAnimationState();
}

class IntroAnimationState extends State<IntroAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationScale;
  late Animation<double> _animationTranslation;
  late Animation<double> _animationRotation;
  late Animation<double> _animationOpacity;

  String fullText = 'Hello User!';
  String displayedText = '';

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3), // Animation duration
      vsync: this,
    );

    // Smooth scaling animation
    _animationScale = Tween<double>(begin: 1.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Rotation animation (rotate from -90 degrees to 0 degrees)
    _animationRotation = Tween<double>(begin: -1.5, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Smooth translation animation (move right)
    _animationTranslation = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Opacity animation
    _animationOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.8, 1.0,
            curve: Curves.easeIn), // Fade out in last part
      ),
    );

    // Add a listener for translation and text update
    _controller.addListener(() {
      double progress = _animationTranslation.value / 100.0;
      int charactersToShow = (progress * fullText.length).floor();
      setState(() {
        displayedText = fullText.substring(0, charactersToShow);
      });
    });

    // Start the animation
    _controller.forward().whenComplete(() {
      // Navigate to login after the animation completes
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _animationOpacity, // Use FadeTransition for opacity
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.center,
                    children: [
                      // The text "Hello User!" updates as the logo moves
                      Text(
                        displayedText,
                        style: const TextStyle(fontSize: 25.0),
                      ),
                      Transform.translate(
                        offset: Offset(
                          _animationTranslation.value,
                          0.0,
                        ),
                        child: Transform.scale(
                          scale: _animationScale.value,
                          child: Transform.rotate(
                            angle: _animationRotation.value,
                            child: SizedBox(
                              width: 75,
                              height: 75,
                              child: Image.asset('lib/assets/Shoppingicon.png'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}