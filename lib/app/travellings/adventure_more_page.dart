import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volvo_hackathon/app/top_level_providers.dart';

class AdventureMorePage extends ConsumerWidget {
  const AdventureMorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final adventureState = watch(adventureProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 24, left: 8, bottom: 24),
              child: Text(
                "Мое путешествие",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
              ),
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "images/${adventureState.state.img}",
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
                      adventureState.state.duration,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    decoration: new BoxDecoration(
                      color: Color(0xff272727),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  left: 0,
                  bottom: 8,
                ),
                Positioned(
                  child: Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 50,
                    child: Text(
                      adventureState.state.distance,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    decoration: new BoxDecoration(
                      color: Color(0xff272727),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                  right: 0,
                  bottom: 8,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 4),
                    child: Text(
                      adventureState.state.title,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff20365A)),
                    ),
                  ),
                  Text("подготовил ${adventureState.state.user}",
                      style: TextStyle(fontSize: 17, color: Color(0xffA7A8A9))),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 32, bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Отмечено точек",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff20365A)),
                      ),
                      Text(
                        "Позади уже",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff20365A)),
                      ),
                      Text(
                        "В пути",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff20365A)),
                      ),
                      Text(
                        "Покорена высота в",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff20365A)),
                      ),
                      Text(
                        "Сэкономлено",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff20365A)),
                      ),
                    ],
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    indent: 2,
                    endIndent: 2,
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "5 из 13",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA7A8A9)),
                      ),
                      Text(
                        "132 / 240 км",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA7A8A9)),
                      ),
                      Text(
                        "14 часов",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA7A8A9)),
                      ),
                      Text(
                        "213 метров",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA7A8A9)),
                      ),
                      Text(
                        "14 трат",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA7A8A9)),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Image.asset("images/adventure_route.png"),

            Text(
              "Volvo всегда рядом. Мы поможем вам с любой проблемой",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffA7A8A9)),
            ),

            Divider(
              height: 16,
              thickness: 1,
                indent: 48,
                endIndent: 48,
                color: Color(0xffC4C4C4),
            ),


            Image.asset("images/road_map.png"),

            Divider(
              height: 8,
              thickness: 1,
              indent: 48,
              endIndent: 48,
              color: Color(0xffC4C4C4),
            ),


            Container(
              margin: EdgeInsets.only(bottom: 24),
              width: 240,
              child: Text(
                "Что вы думаете об этом путешествии?",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff20365A)),
              ),
            ),

            const TextField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Что вам нравится?',
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 24, bottom: 120),
              child: const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Что вам не нравится?',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
