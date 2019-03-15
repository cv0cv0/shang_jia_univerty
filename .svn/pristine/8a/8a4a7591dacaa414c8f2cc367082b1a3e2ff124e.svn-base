import 'package:flutter/material.dart';

import '../model/exam_question.dart';
import '../style/text_style.dart';

class AnswerItem extends StatelessWidget {
  AnswerItem(this.answer, {this.onTap});

  final Answer answer;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            gradient: LinearGradient(
              colors: answer.selected
                  ? <Color>[Color(0xffff635f), Color(0xffff9565)]
                  : <Color>[Color(0xffd2d2d2), Color(0xffd2d2d2)],
            ),
          ),
          child: Stack(
            children: <Widget>[
              answer.selected
                  ? Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Image.asset('asset/icon/selected.png'),
                    )
                  : SizedBox(),
              Align(
                alignment: answer.data.length > 5
                    ? AlignmentDirectional.topStart
                    : AlignmentDirectional.center,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, top: 14.0, right: 10.0, bottom: 12.0),
                  child: Text(answer.data,
                      style: answer.selected
                          ? answerSelectTextStyle
                          : answerUnSelectTextStyle),
                ),
              ),
              Positioned(
                right: 2.0,
                bottom: 2.0,
                child: onTap == null && answer.correct
                    ? Image.asset('asset/icon/accurate.png')
                    : SizedBox(),
              ),
            ],
          ),
        ),
      );
}
