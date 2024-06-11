import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../components/my_card.dart';
import '../search_subjects/subjects.dart';

class SubjectPage extends StatefulWidget {
  final Subject subject;
  const SubjectPage({super.key,required this.subject});

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  final _controller=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subject.title),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            child: PageView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                MyCard(title: "CAT-1", color: Colors.purpleAccent),
                MyCard(title: "CAT-2", color: Colors.amberAccent),
                MyCard(title: "FAT", color: Colors.deepOrangeAccent),
              ],
            ),
          ),
          SizedBox(height: 10,),
          SmoothPageIndicator(controller: _controller, count: 3),
        ],
      ),
    );
  }
}
