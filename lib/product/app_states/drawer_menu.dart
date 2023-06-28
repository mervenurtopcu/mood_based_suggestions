import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_based_suggestions/product/app_states/index.dart';
import '../constants/index.dart';
import '../theme/theme_provider.dart';


class SideMenu extends ConsumerWidget {
   const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Drawer(
      child: ListView(
        children: [
           DrawerHeader(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const ClipOval(
                    child: Image(
                      image: AssetImage('assets/png/ic_logo_rounded.png'),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    StringConstants.drawerHeader,
                    style: TextStyle(color: ref.watch(settingsProvider).isDarkTheme ? ColorConstants.white: ColorConstants.black, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          DrawerListTile(
            title: StringConstants.drawerListTile,
            titleColor: ref.watch(settingsProvider).isDarkTheme ? ColorConstants.white : ColorConstants.black,
            icon: Icon(
              Icons.person,
              color:ref.watch(settingsProvider).isDarkTheme ? ColorConstants.white : ColorConstants.black,
              size: 18,
            ),
            press: () {
              Navigator.pop(context);
              ref.read(navProvider.notifier).updateIndex(3);
            },
          ),

         Padding(
           padding: PaddingConstants.paddingDrawerSwitchButton,
           child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Icon(Icons.dark_mode,color: ref.watch(settingsProvider).isDarkTheme ? ColorConstants.white : ColorConstants.black,),
                   Text(StringConstants.drawerSwitchButton,style: TextStyle(color: ref.watch(settingsProvider).isDarkTheme ? ColorConstants.white : ColorConstants.black,fontSize: 16),),

                 ],
               ),
                Switch(
                 value: ref.watch(settingsProvider).isDarkTheme,
                 onChanged: (value) {
                   if (value) {
                     ref.read(settingsProvider).setDarkTheme();
                   } else {
                     ref.read(settingsProvider).setLightTheme();
                   }
                 },
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.press,
    required this.titleColor,
  }) : super(key: key);

  final String title;
  final Icon icon;
  final VoidCallback press;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
    );
  }
}