import 'package:ecommerce_flutter/bloc/auth/auth_bloc.dart';
import 'package:ecommerce_flutter/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
