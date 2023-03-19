import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class forText extends StatelessWidget {
  final String? upText;
  const forText({
    super.key,
    this.upText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
        right: 15,
        left: 15,
      ),
      child: Text(upText!),
    );
  }
}
