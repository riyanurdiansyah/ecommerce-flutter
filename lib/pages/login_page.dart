import 'dart:io';

import 'package:ecommerce_flutter/bloc/auth/auth_bloc.dart';
import 'package:ecommerce_flutter/bloc/auth/auth_event.dart';
import 'package:ecommerce_flutter/bloc/auth/auth_state.dart';
import 'package:ecommerce_flutter/utils/styles/app_color.dart';
import 'package:ecommerce_flutter/utils/styles/app_style_textfield.dart';
import 'package:ecommerce_flutter/utils/validation/app_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            // const SizedBox(
            //   height: 35,
            // ),
            // Text(
            //   'Masuk',
            //   style: GoogleFonts.adventPro(
            //     fontSize: 24,
            //     color: Colors.blue,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const SizedBox(
              height: 50,
            ),

            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) => TextFormField(
                keyboardType: TextInputType.emailAddress,
                style: AppStyleTextfield.authTextFieldStyle(12),
                decoration: AppStyleTextfield.authFormInput(
                    'Email', 'email@example.com', 12),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => AppValidator.requiredField(
                  value!,
                  errorMsg: "Email tidak boleh kosong",
                ),
                onChanged: (value) => context.read<AuthBloc>().add(
                      ChangeEmail(email: value),
                    ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              style: AppStyleTextfield.authTextFieldStyle(12),
              decoration:
                  AppStyleTextfield.authFormInput('Password', '********', 12)
                      .copyWith(
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.grey.shade400,
                    size: size.shortestSide < 600 ? 22 : 42,
                  ),
                  onPressed: () {},
                ),
              ),
              onChanged: (value) => context.read<AuthBloc>().add(
                    ChangePassword(password: value),
                  ),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: ((context, state) {
                if (state is ErrorPasswordState) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      state.errorPassword!,
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
            BlocBuilder<AuthBloc, AuthState>(
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
                  child: state.isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          'MASUK',
                          style: GoogleFonts.aBeeZee(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  onPressed: () {
                    context.read<AuthBloc>().add(const LoginByEmail(
                        email: 'riyan@gmail.com', password: 'riyan@123'));

                    context
                        .read<AuthBloc>()
                        .add(const ChangeLoading(isLoading: false));
                  },
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
                Platform.isIOS
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
