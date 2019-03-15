import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Container(
            width: 100.0,
            height: 50.0,
            alignment: AlignmentDirectional.center,
            margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              gradient: LinearGradient(
                colors: <Color>[Color(0xffff635f), Color(0xffff9565)],
              ),
            ),
            child:
                Text('交卷', style: TextStyle(color: Colors.white, fontSize: 17.0)),
          ),
        ),
      );
}
