import 'package:flutter/material.dart';

import '../widget/app_bar.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

class ScorePage extends StatelessWidget {
  ScorePage(
      {@required this.name,
      @required this.allCount,
      @required this.correctCount});

  final String name;
  final int allCount;
  final int correctCount;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: scaffold_background,
        appBar: UniversityAppBar(
          titleText: '$name评分',
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('正确：$correctCount题', style: questionTextStyle),
                  SizedBox(height: 15.0),
                  Text('错误：${allCount-correctCount}题',
                      style: questionTextStyle),
                  SizedBox(height: 30.0),
                  Text('满分：${allCount*10}分', style: questionTextStyle),
                  SizedBox(height: 15.0),
                  Text('得分：${correctCount*10}分', style: questionTextStyle),
                  SizedBox(height: 24.0),
                  Container(
                    width: 70.0,
                    height: 28.0,
                    alignment: AlignmentDirectional.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      gradient: LinearGradient(
                        colors: correctCount >= allCount / 2 + 1
                            ? <Color>[Color(0xff22ab88), Color(0xff92d363)]
                            : <Color>[Color(0xffff6263), Color(0xffff6263)],
                      ),
                    ),
                    child: Text(correctCount >= allCount / 2 + 1 ? '合格' : '不合格',
                        style: TextStyle(color: Colors.white, fontSize: 17.0)),
                  ),
                  SizedBox(height: 24.0),
                  Text(correctCount >= allCount / 2 + 1 ? '恭喜你顺利晋级！' : '晋级失败！',
                      style: questionTextStyle),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: FlatButton(
                color: Color(0xffff982d),
                onPressed: () => Navigator.of(context).pop(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(23.0),
                ),
                child: Container(
                  width: double.infinity,
                  height: 45.0,
                  alignment: AlignmentDirectional.center,
                  child: Text('返回',
                        style: TextStyle(color: Colors.white, fontSize: 17.0)),
                ),
              ),
            ),
          ],
        ),
      );
}
