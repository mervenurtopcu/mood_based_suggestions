import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    //TODO: Add Screens
  ];
  @override
  Widget build(BuildContext context) {
    var navIndex = ref.watch(navProvider);
    return Scaffold(
      body: Center(
        child: navIndex.isLoading
            ? const CircularProgressIndicator()
            : _widgetOptions[navIndex.index],
      ),
      bottomNavigationBar: SizedBox(
        height: 100,
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BottomNavigationBar(
                currentIndex: navIndex.index,
                onTap: (index) {
                  ref.read(navProvider.notifier).updateIndex(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'Category'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite_outlined), label: 'Favorite'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
