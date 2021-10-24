import 'package:volvo_hackathon/app/top_level_providers.dart';
import 'package:volvo_hackathon/constants/pages_ids.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFloatingActionButton extends ConsumerWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final bottomNavIndex = watch(bottomNavIndexProvider);

    return FloatingActionButton(
      child: Text(
        'V',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Color(0xff20365A)),
      ),
      onPressed: () {
        bottomNavIndex.state = TRAVELLING_PAGE;
      },
      backgroundColor: Colors.white,
    );
  }
}
