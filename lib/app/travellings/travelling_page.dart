import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volvo_hackathon/constants/pages_ids.dart';
import 'package:volvo_hackathon/data/Adventure.dart';

import '../top_level_providers.dart';

class TravellingPage extends ConsumerWidget {
  const TravellingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    var chosenFilterIndex = watch(chosenFilterIndexProvider);
    var adventureState = watch(adventureProvider);
    final bottomNavIndex = watch(bottomNavIndexProvider);

    final filters = ["Рядом", "Интересное"];
    final adventures = [
      Adventure(
          title: "Алтай - путь к дому!",
          duration: "~2 дн",
          distance: "240 км",
          cubeNumber: 3,
          img: "altai.png",
          user: "Михаил",
          userImage: "altai.png"),
      Adventure(
          title: "Пещеры Австрии",
          duration: "~8 дн",
          distance: "764 км",
          cubeNumber: 1,
          img: "desert.png",
          user: "Игорь",
          userImage: "altai.png"),
    ];


    _buildCard(Adventure adventure, int index) {
      return InkWell(
        onTap: () {
          adventureState.state = adventure;
          bottomNavIndex.state = ADVENTURE_MORE_PAGE;
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            index == 0
                ? Container(
                    child: Text(
                      "Выбрано",
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.w400),
                    ),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.asset(
                          "images/${adventure.img}",
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          width: 90,
                          height: 50,
                          child: Text(
                            adventure.duration,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          decoration: new BoxDecoration(
                            color: Color(0xff272727),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                        ),
                        left:0,
                        top: 0,
                      ),
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          width: 90,
                          height: 50,
                          child: Text(
                            adventure.distance,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          decoration: new BoxDecoration(
                            color: Color(0xff272727),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)),
                          ),
                        ),
                        right: 0,
                        top: 0,
                      ),
                      Positioned(
                        child: Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 4, bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                for (int i = 0; i < adventure.cubeNumber; i++)
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 4, right: 6, left: 6),
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: new BoxDecoration(
                                      color: Color(0xffEBEBEB),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          decoration: new BoxDecoration(
                            color: Color(0xff272727),
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10)),
                          ),
                        ),
                        right: 0,
                        bottom: 8,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          adventure.title,
                          style:
                              TextStyle(fontSize: 20, color: Color(0xff20365A)),
                        ),
                        Text(adventure.user,
                            style: TextStyle(
                                fontSize: 20, color: Color(0xffA7A8A9))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.black87,
              margin: EdgeInsets.only(top: 36, left: 8),
              child: Text(
                "Путешествия",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              // color: Colors.red,
              height: 32,
              margin: EdgeInsets.only(top: 24, left: 24, bottom: 16),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Text(
                            filters[index],
                            style: TextStyle(
                                fontSize: 18,
                                color: chosenFilterIndex.state == index
                                    ? Color(0xff20365A)
                                    : Colors.grey),
                          ),
                          onTap: () {
                            chosenFilterIndex.state = index;
                          },
                        ),
                        chosenFilterIndex.state == index
                            ? Container(
                                margin: EdgeInsets.only(top: 4),
                                width: 7.0,
                                height: 7.0,
                                decoration: new BoxDecoration(
                                  color: Color(0xff20365A),
                                  shape: BoxShape.circle,
                                ),
                              )
                            : Container()
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: adventures.length,
                itemBuilder: (context, index) {
                  return _buildCard(adventures[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

