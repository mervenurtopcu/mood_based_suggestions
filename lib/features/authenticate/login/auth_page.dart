import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:mood_based_suggestions/features/authenticate/login/login_screen.dart';
import 'package:mood_based_suggestions/features/authenticate/register/register_screen.dart';
class AuthPage extends ConsumerStatefulWidget {
  const AuthPage({super.key});

  @override
  ConsumerState createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) =>isLogin ? LoginWidget(onClickedSignUp: toogle) : RegisterScreen(onClickedSignIn: toogle);

  void toogle() {
    setState(() {
      isLogin = !isLogin;
    });
  }
}
