import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mood_based_suggestions/features/category/category_screen.dart';
import 'package:mood_based_suggestions/features/home/home_screen.dart';
import 'package:mood_based_suggestions/features/profile/profile_screen.dart';
import 'package:mood_based_suggestions/product/constants/index.dart';
import 'package:mood_based_suggestions/product/theme/index.dart';
import '../../features/saved_list/saved_list_screen.dart';
import 'drawer_menu.dart';
import 'drawer_provider.dart';
import 'navigation_provider.dart';

class BottomNavBar extends ConsumerStatefulWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const CategoryScreen(),
    const SavedListScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var navIndex = ref.watch(navProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.drawerHeader),
        leading: IconButton(
          icon: ref.watch(settingsProvider).isDarkTheme
              ? const Icon(
                  Icons.menu,
                  color: ColorConstants.white,
                )
              : const Icon(
                  Icons.menu,
                  color: ColorConstants.black,
                ),
          onPressed: ref.read(menuAppController).controlMenu,
        ),
      ),
      key: ref.watch(menuAppController).scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: navIndex.isLoading
                    ? const CircularProgressIndicator()
                    : _widgetOptions[navIndex.index],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          backgroundColor:  ref.watch(settingsProvider).isDarkTheme ? ColorConstants.loginTextFieldFocus : ColorConstants.loginLightButton,
         // shape: const CircleBorder(),
          mini: true,
          onPressed: () {},
          child:  Icon(
            Icons.emoji_emotions_outlined,
            color:  ref.watch(settingsProvider).isDarkTheme ? ColorConstants.black : ColorConstants.white,
          ),
        ),
      bottomNavigationBar:
      BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: navIndex.index,
        onTap: (index) {
          ref.read(navProvider.notifier).updateIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: StringConstants.bottomNavBarHome),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: StringConstants.bottomNavBarCategory),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined),
              label: StringConstants.bottomNavBarFavorites),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: StringConstants.bottomNavBarProfile),
        ],

      ),
    );
  }
}
