import 'package:volvo_hackathon/app/travellings/adventure_more_page.dart';
import 'package:volvo_hackathon/app/travellings/travelling_page.dart';
import 'package:volvo_hackathon/constants/pages_ids.dart';
import 'package:volvo_hackathon/widgets/bottom_navigation_bar.dart';
import 'package:volvo_hackathon/widgets/floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app/top_level_providers.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      headerBuilder: () => WaterDropHeader(),
      // Configure the default header indicator. If you have the same header indicator for each page, you need to set this
      footerBuilder: () => ClassicFooter(),
      // Configure default bottom indicator
      headerTriggerDistance: 80.0,
      // header trigger refresh trigger distance
      springDescription:
      SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
      // custom spring back animate,the props meaning see the flutter api
      maxOverScrollExtent: 100,
      //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
      maxUnderScrollExtent: 0,
      // Maximum dragging range at the bottom
      enableScrollWhenRefreshCompleted: true,
      //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
      enableLoadingWhenFailed: true,
      //In the case of load failure, users can still trigger more loads by gesture pull-up.
      hideFooterWhenNotFull: false,
      // Disable pull-up to load more functionality when Viewport is less than one screen
      enableBallisticLoad: true,
      //
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyNavigation(),
      ),
    );
  }
}

class MyNavigation extends ConsumerWidget {
  const MyNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final bottomNavIndex = watch(bottomNavIndexProvider);
    final appBarName = watch(pageNameProvider);

    Widget? _getBody() {
      switch (bottomNavIndex.state) {
        case TRAVELLING_PAGE:
          {
            return TravellingPage();
          }
        case ADVENTURE_MORE_PAGE:
          {
            return AdventureMorePage();
          }
      }
    }

    List<Widget>? _getAppBarActions() {
      switch (bottomNavIndex.state) {
        case TESTS_PAGE:
          {
            return <Widget>[];
          }
        case CHAT_PAGE:
          {
            return <Widget>[
              IconButton(
                onPressed: () async {
                  String url = "https://telegram.me/";
                  print("launchingUrl: $url");
                  await canLaunch(url)
                      ? await launch(url)
                      : throw 'Could not launch $url';
                },
                icon: Icon(Icons.airplanemode_active_outlined),
                iconSize: 28,
              ),
            ];
          }
        case GUIDES_PAGE:
          {
            return <Widget>[];
          }
        case PROFILE_PAGE:
          {
            return <Widget>[
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.edit), iconSize: 28),
            ];
          }
        case TODO_PAGE:
          {
            return <Widget>[];
          }
      }
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${appBarName.state}'),
      //   actions: _getAppBarActions(),
      // ),
      body: _getBody(),
      floatingActionButton: MyFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: MyNavigationBar(),
    );
  }
}
