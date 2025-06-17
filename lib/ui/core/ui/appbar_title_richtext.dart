import 'package:flutter/material.dart';

class AppbarTitleRichText extends StatelessWidget {
  final String title;

  const AppbarTitleRichText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(
          context,
        ).style.copyWith(fontSize: 30, fontWeight: FontWeight.w700),
        children: [
          TextSpan(text: title),
          TextSpan(
            text: ".",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.amberAccent,
            ),
          ),
        ],
      ),
    );
  }
}
