import 'package:ecommerce_flutter/utils/styles/app_style_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginByPhonePage extends StatelessWidget {
  const LoginByPhonePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        iconTheme: const IconThemeData(
          size: 20,
          color: Colors.black,
        ),
        centerTitle: false,
        title: Text(
          'Masuk dengan handphone',
          style: GoogleFonts.aBeeZee(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              style: AppStyleTextfield.authTextFieldStyle(12),
              decoration: AppStyleTextfield.authFormInput(
                  'No Handphone', '8123456789', 12),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
