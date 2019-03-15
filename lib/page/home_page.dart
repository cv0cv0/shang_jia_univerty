import 'package:flutter/material.dart';

import '../model/exam_question.dart';
import '../widget/app_bar.dart';
import '../widget/circle_text_icon.dart';
import 'history_page.dart';
import 'paper_page.dart';
import 'study_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: UniversityAppBar(
          titleText: '上家大学',
        ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 45.0),
            Container(
              width: 75.0,
              height: 30.0,
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Text(
                'S级',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.star, size: 18.0, color: Colors.black),
                SizedBox(width: 4.0),
                Icon(Icons.star, size: 18.0, color: Colors.black),
                SizedBox(width: 4.0),
                Icon(Icons.star, size: 18.0, color: Colors.black),
                SizedBox(width: 4.0),
                Icon(Icons.star, size: 18.0, color: Colors.black),
                SizedBox(width: 4.0),
                Icon(Icons.star, size: 18.0, color: Colors.black),
              ],
            ),
            SizedBox(height: 35.0),
            Text(
              '升级SS级需要参加：2018期中考试',
              style: TextStyle(color: Color(0xff222222), fontSize: 17.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '请于2018/12/12 19:00前参加考试',
              style: TextStyle(color: Color(0xff222222), fontSize: 15.0),
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleTextIcon(
                  text: '开始学习',
                  iconPath: 'asset/icon/study.png',
                  colors: <Color>[Color(0xff41cad5), Color(0xff5988f0)],
                  onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => StudyPage(),
                        ),
                      ),
                ),
                SizedBox(width: 25.0),
                CircleTextIcon(
                  text: '开始考试',
                  iconPath: 'asset/icon/exam.png',
                  colors: <Color>[Color(0xff92d363), Color(0xff22ab88)],
                  onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PaperPage(
                                canPress: true,
                                name: '2018期末考试',
                                questions: <Question>[
                                  Question(
                                    QuestionType.single_select,
                                    '钻石型淋浴房转角的标准度数是______。',
                                    <Answer>[
                                      Answer('45°'),
                                      Answer('90°', correct: true),
                                      Answer('120°'),
                                      Answer('135°'),
                                    ],
                                  ),
                                  Question(
                                    QuestionType.multi_select,
                                    '安装卫浴产品前期和后期需要准备和注意的有哪几点？请选出所有正确答案。',
                                    <Answer>[
                                      Answer('上门前需要与客户沟通好准备的配件（商家不包配件的情况）',
                                          correct: true),
                                      Answer('检查水电管路预留的位置是否规范，货有没有送错'),
                                      Answer('长选项左对齐', correct: true),
                                      Answer('长选项最长34个汉字', correct: true),
                                      Answer('题目+选项总字数最多180个汉字'),
                                      Answer('题目+选项最多6个'),
                                    ],
                                  ),
                                  Question(
                                    QuestionType.judgment,
                                    '钻石型淋浴房转角的标准度数是135°。',
                                    <Answer>[
                                      Answer('是'),
                                      Answer('否', correct: true),
                                    ],
                                  ),
                                ],
                              ),
                        ),
                      ),
                ),
              ],
            ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleTextIcon(
                  text: '暂缺',
                  iconPath: 'asset/icon/lack.png',
                  colors: <Color>[Color(0xffb5b5b5), Color(0xffb5b5b5)],
                ),
                SizedBox(width: 25.0),
                CircleTextIcon(
                  text: '历史试卷',
                  iconPath: 'asset/icon/history.png',
                  colors: <Color>[Color(0xffff9465), Color(0xffff645f)],
                  onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HistoryPage(),
                        ),
                      ),
                ),
              ],
            ),
          ],
        ),
      );
}
