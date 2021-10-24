import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:volvo_hackathon/app/top_level_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyNavigationBar extends ConsumerWidget {
  MyNavigationBar({
    Key? key,
  }) : super(key: key);

  final iconsList = <IconData>[
    Icons.map_rounded,
    Icons.message,
    Icons.help,
    Icons.person,
  ];

  final iconsText = <String>[
    'Карта',
    'Форум',
    'Помощь',
    'Профиль',
  ];

  @override
  Widget build(BuildContext context, watch) {
    final bottomNavIndex = watch(bottomNavIndexProvider);

    return AnimatedBottomNavigationBar.builder(
      itemCount: iconsList.length,
      tabBuilder: (index, isActive) {
        final color = isActive ? Colors.white : Colors.white;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconsList[index],
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "${iconsText[index]}",
                style: TextStyle(color: color),
              ),
            )
          ],
        );
      },
      leftCornerRadius: 10,
      rightCornerRadius: 10,
      splashColor: Colors.blue[50],
      splashRadius: 30,
      splashSpeedInMilliseconds: 250,
      activeIndex: bottomNavIndex.state,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.sharpEdge,
      onTap: (index) {
        bottomNavIndex.state = index;
      },
      backgroundColor: Color(0xff20365A),
    );
  }
}
