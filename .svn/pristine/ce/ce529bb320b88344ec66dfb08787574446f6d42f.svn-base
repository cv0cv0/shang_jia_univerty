import 'package:flutter/material.dart';

class UniversityAppBar extends AppBar {
  UniversityAppBar({@required this.titleText, this.onTap})
      : super(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(titleText),
          leading: onTap == null
              ? null
              : InkResponse(
                  onTap: onTap,
                  child: Center(
                    child: Text('返回', style: TextStyle(fontSize: 16.0)),
                  ),
                ),
        );

  final String titleText;
  final VoidCallback onTap;
}
