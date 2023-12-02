import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:procuracaoapp/bloc/auth_bloc.dart';
import 'package:procuracaoapp/bloc/post_bloc.dart';
import 'package:procuracaoapp/views/restrict_area/view_new_post.dart';
import 'package:procuracaoapp/views/normal_area/view_introduce.dart';
import 'package:procuracaoapp/views/normal_area/view_login.dart';
import 'package:procuracaoapp/views/normal_area/view_register.dart';
import 'package:procuracaoapp/wrapper.dart';

class AppRouter {
  final AuthBloc _authBloc = AuthBloc();
  final PostBloc _postBloc = PostBloc();
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authBloc,
            child: BlocProvider.value(
              value: _postBloc,
              child: const Wrapper(),
            ),
          ),
        );
      case '/introduction':
        return MaterialPageRoute(builder: (_) => const ViewIntroduction());
      case '/login':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authBloc,
            child: const ViewLogin(),
          ),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _authBloc,
            child: const ViewRegister(),
          ),
        );
      case '/new-post':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _postBloc,
            child: const ViewNewPost(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const Text('Erro'));
    }
  }

  void dispose() {
    _authBloc.close();
  }
}
