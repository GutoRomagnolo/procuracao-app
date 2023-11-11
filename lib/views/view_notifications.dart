import 'package:flutter/material.dart';
import 'package:procuracaoapp/components/notification_component.dart';
import 'package:procuracaoapp/mock.dart';

class ViewNotifications extends StatelessWidget {
  const ViewNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(240, 241, 223, 1),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: commentsMock
            .map((e) => NotificationComponent(commentModel: e))
            .toList(),
      ),
    );
  }
}
