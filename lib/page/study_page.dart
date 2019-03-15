import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/study.dart';
import '../widget/app_bar.dart';
import '../style/colors.dart';
import '../style/text_style.dart';

class StudyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  static const _platform = const MethodChannel('shangjia.dongjian.com/channel');
  final _items = List.generate(10, (i) => Study('TOTO品牌认证', 'A级必须', 'PPT'));

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: scaffold_background,
        appBar: UniversityAppBar(
          titleText: '学习资料',
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
              _items.addAll(
                  List.generate(5, (i) => Study('TOTO品牌认证', 'A级必须', 'PPT')));
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
        onTap: () => _platform.invokeMethod('download',
            'https://qd.myapp.com/myapp/qqteam/AndroidQQ/mobileqq_android.apk'),
        child: Padding(
          padding:
              EdgeInsets.only(left: 10.0, top: 8.0, right: 10.0, bottom: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(item.title, style: listTitleTextStyle),
              Divider(),
              Text(item.content, style: listContentTextStyle),
              Text(item.type, style: listContentTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
