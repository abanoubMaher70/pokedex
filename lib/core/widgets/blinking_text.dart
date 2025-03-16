import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/text_styles.dart';

class BlinkingText extends StatefulWidget {
  final String text;
  const BlinkingText({super.key, required this.text});

  @override
  State<BlinkingText> createState() => _BlinkingTextState();
}

class _BlinkingTextState extends State<BlinkingText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    intBlinkingAnimation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController,
      child: Text(
        widget.text,
        textAlign: TextAlign.center,
        style: TextStyles.pixelFont20,
      ),
    );
  }

  void intBlinkingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }
}
