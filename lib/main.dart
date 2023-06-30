import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_based_suggestions/features/authenticate/login/login_screen.dart';
import 'package:mood_based_suggestions/product/app_states/index.dart';
import 'package:mood_based_suggestions/product/constants/index.dart';
import 'package:mood_based_suggestions/product/global/utils.dart';
import 'package:mood_based_suggestions/product/services/shared_manager.dart';
import 'package:mood_based_suggestions/product/theme/index.dart';

import 'features/authenticate/register/register_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedManager.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}
final navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      title: StringConstants.materialAppTitle,
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      theme: ref.watch(settingsProvider).isDarkTheme ? DarkTheme.darkTheme :LightTheme.lightTheme,
      home:  const LoginScreen(),
    );
  }
}

