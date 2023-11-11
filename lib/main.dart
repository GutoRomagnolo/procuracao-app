import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:procuracaoapp/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ProcuraCão',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(76, 212, 103, 1),
      ),
      // home: MultiBlocProvider(
      //   providers: [
      //     BlocProvider(create: (context) => AuthBloc()),
      //   ],
      //   child: const Scaffold(
      //     body: ViewLogin(),
      //   ),
      // ),
      onGenerateRoute: _appRouter.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRouter.dispose();
    super.dispose();
  }
}
