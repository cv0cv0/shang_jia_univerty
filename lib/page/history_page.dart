import 'dart:async';

import 'package:flutter/material.dart';

import '../model/exam_question.dart';
import '../model/history.dart';
import '../style/colors.dart';
import '../style/text_style.dart';
import '../widget/app_bar.dart';
import 'paper_page.dart';

class HistoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _items = List.generate(10,
      (i) => History('2018入门级期中考试', '2018.6.7', '18:00-19:00', '90分', true));

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: scaffold_background,
        appBar: UniversityAppBar(
          titleText: '历史试卷',
          onTap: () => Navigator.of(context).maybePop(),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(8.0),
          itemBuilder: _itemBuilder,
        ),
      );

  Widget _itemBuilder(BuildContext context, int index) {
    if (index.isOdd) return SizedBox(height: 4.0);

    final i = index ~/ 2;
    if (i == _items.length) {
      Future.delayed(
        Duration(seconds: 2),
        () => setState(() {
              _items.addAll(List.generate(
                  5,
                  (i) => History('2018入门级期末考试', '2018.5.30', '18:00-19:00',
                      '59分', false)));
            }),
      );
      return Center(
        child: RefreshProgressIndicator(),
      );
    } else if (i > _items.length) {
      return null;
    }

    final item = _items[i];
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PaperPage(
                      canPress: false,
                      name: '2018期末考试',
                      questions: <Question>[
                        Question(
                          QuestionType.single_select,
                          '钻石型淋浴房转角的标准度数是______。',
                          <Answer>[
                            Answer('45°'),
                            Answer('90°', correct: true, selected: true),
                            Answer('120°'),
                            Answer('135°'),
                          ],
                        ),
                        Question(
                          QuestionType.multi_select,
                          '安装卫浴产品前期和后期需要准备和注意的有哪几点？请选出所有正确答案。',
                          <Answer>[
                            Answer('上门前需要与客户沟通好准备的配件（商家不包配件的情况）',
                                correct: true, selected: true),
                            Answer('检查水电管路预留的位置是否规范，货有没有送错'),
                            Answer('长选项左对齐', correct: true, selected: true),
                            Answer('长选项最长34个汉字', correct: true, selected: true),
                            Answer('题目+选项总字数最多180个汉字'),
                            Answer('题目+选项最多6个'),
                          ],
                        ),
                        Question(
                          QuestionType.judgment,
                          '钻石型淋浴房转角的标准度数是135°。',
                          <Answer>[
                            Answer('是'),
                            Answer('否', correct: true, selected: true),
                          ],
                        ),
                      ],
                    ),
              ),
            ),
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.0, top: 8.0, right: 10.0, bottom: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset('asset/icon/history_small.png'),
                  SizedBox(width: 10.0),
                  Text(item.title, style: listTitleTextStyle),
                ],
              ),
              Divider(),
              Text(item.date, style: listContentTextStyle),
              Text(item.time, style: listContentTextStyle),
              Row(
                children: <Widget>[
                  Text(item.score, style: listContentTextStyle),
                  SizedBox(width: 10.0),
                  Text(
                    item.qualify ? '合格' : '不合格',
                    style: listContentTextStyle.copyWith(
                        color: item.qualify
                            ? Color(0xff22ac38)
                            : Color(0xffff0000)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
