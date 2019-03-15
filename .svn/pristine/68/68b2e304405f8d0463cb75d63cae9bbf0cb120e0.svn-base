import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({@required this.position, @required this.onTap});

  final Position position;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: position == Position.left
              ? AlignmentDirectional.bottomStart
              : AlignmentDirectional.bottomEnd,
          child: Container(
            width: 50.0,
            height: 50.0,
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
                colors: <Color>[Color(0xff656afd), Color(0xff50a1e7)],
              ),
            ),
            child: position == Position.left
                ? Image.asset('asset/icon/arrow_left.png')
                : Image.asset('asset/icon/arrow_right.png'),
          ),
        ),
      );
}

enum Position {
  left,
  right,
}
