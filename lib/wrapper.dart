import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';
import 'package:procuracaoapp/views/restrict_area/view_feed.dart';
import 'package:procuracaoapp/views/normal_area/view_introduce.dart';
import 'package:procuracaoapp/views/view_navigation.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Erro ao se conectar com o Firebase'),
                content: Text(state.message),
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state is Authenticated) {
          return authenticatedWidget(context);
        } else {
          return unauthenticatedWidget(context);
        }
      },
    );
  }
}

Widget authenticatedWidget(BuildContext context) {
  return const ViewNavigation();
}

Widget unauthenticatedWidget(BuildContext context) {
  return const ViewIntroduction();
}
