import 'dart:io';
import 'package:ecommerce_flutter/bloc/login/login_bloc.dart';
import 'package:ecommerce_flutter/bloc/login/login_event.dart';
import 'package:ecommerce_flutter/bloc/login/login_state.dart';
import 'package:ecommerce_flutter/utils/routes/app_route.dart';
import 'package:ecommerce_flutter/utils/styles/app_color.dart';
import 'package:ecommerce_flutter/utils/styles/app_style_textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: const FlutterLogo(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Hambur',
                  style: GoogleFonts.adventPro(
                    fontSize: 24,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '.in',
                  style: GoogleFonts.adventPro(
                    fontSize: 24,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) => TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: AppStyleTextfield.authTextFieldStyle(12),
                decoration: AppStyleTextfield.authFormInput(
                    'Email', 'email@example.com', 12),
                onChanged: (value) => context.read<LoginBloc>().add(
                      ChangeEmail(
                        email: value,
                      ),
                    ),
              ),
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: ((context, state) {
                if (state is ErrorInputState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      state.errorEmail,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
            const SizedBox(
              height: 15,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) => TextFormField(
                style: AppStyleTextfield.authTextFieldStyle(12),
                // obscureText: state is IsObsecurePasswordState ? false : true,
                decoration:
                    AppStyleTextfield.authFormInput('Password', '********', 12)
                        .copyWith(
                  suffixIcon: IconButton(
                    onPressed: () {
                      // print("EMAIL : ${state.email}");
                      // print("PASS : ${state.password}");
                    },
                    icon: Icon(
                      Icons.visibility,
                      color: Colors.grey.shade400,
                      size: size.shortestSide < 600 ? 22 : 42,
                    ),
                  ),
                ),
                onChanged: (value) => context.read<LoginBloc>().add(
                      ChangePassword(
                        password: value,
                      ),
                    ),
              ),
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: ((context, state) {
                if (state is ErrorInputState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      // state.password ?? 'kosong jg',
                      state.errorPassword,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 11,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              }),
            ),
            const SizedBox(
              height: 25,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) => SizedBox(
                width: size.width,
                height: size.shortestSide < 600 ? 45 : 75,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  onPressed: () {},
                  // onPressed: state is PasswordValidState
                  //     ? state is EmailValidState
                  //         ? () {
                  //             context.read<LoginBloc>().add(LoginByEmail(
                  //                 email: state.email!,
                  //                 password: state.password!));

                  //             context
                  //                 .read<LoginBloc>()
                  //                 .add(const ChangeLoading(isLoading: false));
                  //           }
                  //         : null
                  //     : null,
                  child: Text(
                    'MASUK',
                    style: GoogleFonts.aBeeZee(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    color: Colors.grey.shade200,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'atau masuk dengan',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 2,
                    color: Colors.grey.shade200,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRouteName.register);
                  },
                  child: Image.asset(
                    'assets/images/google.png',
                    width: 30,
                  ),
                ),
                Image.asset(
                  'assets/images/hp.png',
                  width: 30,
                  color: Colors.black,
                ),
                kIsWeb
                    ? const SizedBox()
                    : Platform.isIOS
                        ? Image.asset(
                            'assets/images/apple.png',
                            width: 30,
                            color: Colors.black,
                          )
                        : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
