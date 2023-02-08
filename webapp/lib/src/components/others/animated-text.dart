

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class CustomAnimatedText extends StatelessWidget {
  //List<String> list;
  const CustomAnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      pause: Duration.zero,
      animatedTexts: [
        FadeAnimatedText("Tudo para sua casa!"),
        FadeAnimatedText("Tudo para o seu carro!"),
        FadeAnimatedText("Promoção especial somente hoje!")
      ],
    );
  }
}