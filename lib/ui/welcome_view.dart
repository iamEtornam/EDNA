import 'package:edna_app/resources/resources.dart';
import 'package:edna_app/router.dart';
import 'package:edna_app/theme/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/custom_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final nameTextEditController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 5,
          ),
          Center(
              child: Image.asset(
            Images.ednaLogo,
            width: 120,
            height: 120,
          )),
          const SizedBox(height: 24),
          Center(
              child: Text('Welcome to EDNA.ai',
                  style: GoogleFonts.roboto()
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 32))),
          const SizedBox(height: 5),
          Center(
              child: Text('your personal AI companion',
                  style: GoogleFonts.poppins()
                      .copyWith(fontStyle: FontStyle.italic))),
          const SizedBox(height: 32),
          CustomTextField(
            placeholderText: 'e.g Kofi Mensah',
            autocorrect: false,
            keyboardType: TextInputType.name,
            maxLines: 1,
            textCapitalization: TextCapitalization.words,
            label: 'What is your name?',
            textController: nameTextEditController,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            onPressed: () {
              context.goNamed(RoutesName.chat,
                  extra: nameTextEditController.text);
            },
            label: 'Continue',
          )
        ],
      ),
    );
  }
}
