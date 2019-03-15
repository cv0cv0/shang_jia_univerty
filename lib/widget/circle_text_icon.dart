import 'package:flutter/material.dart';

class CircleTextIcon extends StatelessWidget {
  const CircleTextIcon({
    @required this.text,
    @required this.iconPath,
    @required this.colors,
    this.onTap,
  });

  final String text;
  final String iconPath;
  final List<Color> colors;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: 125.0,
          height: 125.0,
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: colors,
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(iconPath),
              SizedBox(height: 8.0),
              Text(text, style: TextStyle(color: Colors.white, fontSize: 17.0)),
            ],
          ),
        ),
      );
}
