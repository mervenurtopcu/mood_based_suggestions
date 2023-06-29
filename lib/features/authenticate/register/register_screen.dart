import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mood_based_suggestions/features/authenticate/login/login_screen.dart';
import 'package:mood_based_suggestions/product/constants/index.dart';
import 'package:mood_based_suggestions/product/theme/index.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_subtitle.dart';
import 'package:mood_based_suggestions/product/widget/text/authentication_title.dart';
import '../../../product/widget/button/authentication_button.dart';
import '../../../product/widget/text_field/authentication_text_field.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ref.watch(settingsProvider).isDarkTheme ? ColorConstants.loginBackground : ColorConstants.loginLightBackground,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex:1,child: Center(
              child: AuthTitle(
                text: StringConstants.registerScreenTitle,
                isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
              ),
            ),),
            const Expanded(flex:1,child: Center(
              child: AuthSubtitle(
                text: StringConstants.registerScreenTitle,
              ),
            ),),
            Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AuthTextField(icon: const Icon(Icons.person_outline_outlined),labelText: StringConstants.registerScreenName,isDarkTheme: ref.watch(settingsProvider).isDarkTheme,obscureText: false,),
            ),),
            const SizedBox(height: 15,),
            Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AuthTextField(icon: const Icon(Icons.email_outlined),labelText: StringConstants.registerScreenEmail,isDarkTheme: ref.watch(settingsProvider).isDarkTheme,obscureText: false,),
            ),),
            const SizedBox(height: 15,),
            Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AuthTextField(icon: const Icon(Icons.lock_open_outlined),labelText: StringConstants.registerScreenPassword,isDarkTheme: ref.watch(settingsProvider).isDarkTheme,obscureText: true,),
            ),),//Password
            const SizedBox(height: 15,),
            Expanded(flex: 1,child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: AuthTextField(icon: const Icon(Icons.lock_open_outlined),labelText: StringConstants.registerScreenConfirmPassword,isDarkTheme: ref.watch(settingsProvider).isDarkTheme,obscureText: true,),
            ),),
            const SizedBox(height: 15,),
            Expanded(flex: 1,child: Center(
              child: AuthButton(
                text: StringConstants.registerScreenSignUpButton,
                isDarkTheme: ref.watch(settingsProvider).isDarkTheme,
                onPressed: (){},
              ),
            ),),
            Expanded(flex: 1,child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(StringConstants.registerScreenLoginText,style: TextStyle(color: ref.watch(settingsProvider).isDarkTheme?ColorConstants.white:ColorConstants.loginSubtitle,fontSize: 14,fontWeight: FontWeight.w300),),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const LoginScreen()));
                    },
                    child: Text(StringConstants.registerScreenLoginTextButton,style: TextStyle(color: ref.watch(settingsProvider).isDarkTheme?Colors.white:ColorConstants.loginLightButton,fontSize: 14,fontWeight: FontWeight.w400),),
                  ),
                ],
              ),
            ),),
          ],
        ),
      ),
    );
  }
}
