import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/components/post_component.dart';
import 'package:procuracaoapp/mock.dart';
import 'package:procuracaoapp/model/post_model.dart';
import 'package:procuracaoapp/components/post_details_component.dart';
import 'package:procuracaoapp/bloc/comment_bloc.dart';

class ViewPosts extends StatelessWidget {
  const ViewPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(240, 241, 223, 1),
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: postsMock.map((e) {
          return InkWell(
            onTap: () {
              _openPostDetails(context, e);
            },
            child: PostComponent(postModel: e),
          );
        }).toList(),
      ),
    );
  }

  void _openPostDetails(BuildContext context, PostModel post) {
    CommentBloc commentBloc = CommentBloc();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: commentBloc, child: PostDetailsScreen(postModel: post)
        )
      ),
    );
  }
}
