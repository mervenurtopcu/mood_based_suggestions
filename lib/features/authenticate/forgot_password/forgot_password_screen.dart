import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mood_based_suggestions/product/constants/index.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_subtitle.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_title.dart';
import 'package:mood_based_suggestions/product/widget/text_form_field/authentication_text_form_field.dart';

import '../../../main.dart';
import '../../../product/global/utils.dart';
import '../../../product/theme/theme_provider.dart';
import '../../../product/widget/button/authentication_button.dart';


class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ref.watch(settingsProvider).isDarkTheme
          ? ColorConstants.loginBackground
          : ColorConstants.loginLightBackground,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              AuthTitle(
                  text: StringConstants.forgotPasswordScreenTitle,
                  isDarkTheme: ref.watch(settingsProvider).isDarkTheme),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              const AuthSubtitle(
                  text: StringConstants.forgotPasswordScreenSubtitle),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              AuthTextFormField(
                  icon: const Icon(Icons.mail_outline_outlined),
                  labelText: StringConstants.loginScreenEmail,
                  isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                  obscureText: false,
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: AuthButton(
                  text: StringConstants.forgotPasswordScreenButton,
                  isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                  onPressed: resetPassword,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  Future resetPassword() async{
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ));
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar(StringConstants.utilsSnackBarText);
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      Utils.showSnackBar( e.message);
      Navigator.of(context).pop();
    }

  }
}
