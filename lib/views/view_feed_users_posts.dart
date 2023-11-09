import 'package:flutter/material.dart';
import 'package:procuracaoapp/components/post_component.dart';
import 'package:procuracaoapp/mock.dart';

class ViewFeedUsersPosts extends StatelessWidget {
  const ViewFeedUsersPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(240, 241, 223, 1),
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: postsMock.map((e) => PostComponent(postModel: e)).toList(),
      ),
    );
  }
}
