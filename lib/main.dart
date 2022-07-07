import 'package:ecommerce_flutter/bloc/auth/auth_bloc.dart';
import 'package:ecommerce_flutter/bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_flutter/utils/routes/app_generate_route.dart'
    as router;

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
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
      ],
      child: const MaterialApp(
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
