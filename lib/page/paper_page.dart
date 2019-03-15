import 'dart:async';

import 'package:flutter/material.dart';

import '../model/exam_question.dart';
import '../style/text_style.dart';
import '../widget/answer_item.dart';
import '../widget/app_bar.dart';
import '../widget/circle_button.dart';
import '../widget/submit_button.dart';
import 'score_page.dart';

class PaperPage extends StatefulWidget {
  PaperPage({
    @required this.canPress,
    @required this.name,
    @required this.questions,
  });

  final bool canPress;
  final String name;
  final List<Question> questions;

  @override
  _PaperPageState createState() => _PaperPageState();
}

class _PaperPageState extends State<PaperPage>
    with SingleTickerProviderStateMixin {
  int serialNumber = 1;
  bool isFirst = true;
  bool isLast = false;

  TabController _controller;
  List<Question> questions;
  int length;

  Timer timer;
  int minute;
  int second;

  @override
  void initState() {
    super.initState();
    questions = widget.questions;
    length = questions.length;
    _controller = TabController(length: length, vsync: this);
    _controller.addListener(() {
      final index = _controller.index;
      setState(() {
        serialNumber = index + 1;
        if (index == 0)
          isFirst = true;
        else
          isFirst = false;
        if (index == length - 1)
          isLast = true;
        else
          isLast = false;
      });
    });

    if (widget.canPress) {
      minute = 30;
      second = 0;
      timer = Timer.periodic(
          Duration(seconds: 1),
          (t) => setState(() {
                if (second != 0) {
                  second--;
                  if (minute == 0 && second == 0) {
                    timer.cancel();
                    Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => ScorePage(
                                  name: widget.name,
                                  allCount: 3,
                                  correctCount: 3,
                                ),
                          ),
                        );
                  }
                } else {
                  second = 59;
                  minute--;
                }
              }));
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: UniversityAppBar(
          titleText: '${widget.name}$serialNumber/$length',
          onTap: () => Navigator.of(context).maybePop(),
        ),
        body: Stack(
          children: <Widget>[
            TabBarView(
              controller: _controller,
              children: questions
                  .map((question) =>
                      _QuestionWidget(question, canPress: widget.canPress))
                  .toList(),
            ),
            widget.canPress
                ? Positioned(
                    top: 16.0,
                    right: 10.0,
                    child: Text(
                        '${minute<10?0:''}$minute\' ${second<10?0:''}$second\"',
                        style: questionTimeTextStyle),
                  )
                : SizedBox(),
            isFirst
                ? SizedBox()
                : CircleButton(
                    position: Position.left,
                    onTap: () => _handleArrowButtonPress(-1),
                  ),
            isLast
                ? widget.canPress
                    ? SubmitButton(
                        onTap: () {
                          int correctCount = 0;
                          questions.forEach((question) {
                            final length = question.answers.length;
                            int rightCount = 0;
                            int answerCount = 0;
                            for (var i = 0; i < length; i++) {
                              final answer = question.answers[i];
                              if (question.type == QuestionType.multi_select) {
                                if (answer.correct) answerCount++;
                                if (answer.selected && answer.correct)
                                  rightCount++;
                              } else {
                                if (answer.correct && answer.selected)
                                  correctCount++;
                              }
                            }
                            if (question.type == QuestionType.multi_select &&
                                rightCount == answerCount) correctCount++;
                          });
                          Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ScorePage(
                                        name: widget.name,
                                        allCount: questions.length,
                                        correctCount: correctCount,
                                      ),
                                ),
                              );
                        },
                      )
                    : SizedBox()
                : CircleButton(
                    position: Position.right,
                    onTap: () => _handleArrowButtonPress(1),
                  ),
          ],
        ),
      );

  void _handleArrowButtonPress(int delta) {
    if (!_controller.indexIsChanging)
      _controller.animateTo((_controller.index + delta).clamp(0, length - 1));
  }

  @override
  void dispose() {
    _controller.dispose();
    if (timer != null && timer.isActive) timer.cancel();
    super.dispose();
  }
}

class _QuestionWidget extends StatefulWidget {
  _QuestionWidget(this.question, {@required this.canPress});

  final Question question;
  final canPress;

  @override
  State<StatefulWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<_QuestionWidget> {
  Question question;
  bool canPress;

  @override
  void initState() {
    super.initState();
    question = widget.question;
    canPress = widget.canPress;
  }

  @override
  Widget build(BuildContext context) => ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
        children: _buildChildren(),
      );

  List<Widget> _buildChildren() {
    final children = <Widget>[
      Text(_getQuestionTypeText(question.type), style: questionTypeTextStyle),
      SizedBox(height: 30.0),
      Text(question.data, style: questionTextStyle),
      SizedBox(height: 25.0),
    ];

    final answers = question.answers;
    for (var i = 0; i < answers.length; i++) {
      children.add(AnswerItem(answers[i],
          onTap: canPress
              ? () => setState(() {
                    final answer = answers[i];
                    answer.selected = !answer.selected;
                    if (question.type == QuestionType.single_select ||
                        question.type == QuestionType.judgment) {
                      answers.forEach((ans) {
                        if (ans != answer) ans.selected = false;
                      });
                    }
                  })
              : null));
      if (i != answers.length - 1) children.add(SizedBox(height: 10.0));
    }

    return children;
  }

  String _getQuestionTypeText(QuestionType type) {
    switch (type) {
      case QuestionType.single_select:
        return '单选题';
      case QuestionType.multi_select:
        return '多选题';
      case QuestionType.judgment:
        return '判断题';
    }
    return null;
  }
}
