import 'package:volvo_hackathon/constants/pages_ids.dart';
import 'package:volvo_hackathon/constants/pages_names.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:volvo_hackathon/data/Adventure.dart';

final userNameProvider = Provider((ref) => 'Алексей Кудашкин');
final userEmailProvider = Provider((ref) => 'avk224@tpu.ru');
final userPhoneProvider = Provider((ref) => '+7 (908) 954-76-94');
final userDateBirthProvider =
    Provider<DateTime>((ref) => DateTime(2000, 10, 14));
final userPositionProvider = Provider((ref) => 'Android-разработчик');

final userCompleteIntroductionProvider = StateProvider((ref) => false);

final chosenFilterIndexProvider = StateProvider((ref) => 0);
final adventureProvider = StateProvider((ref) => Adventure(
    title: "Алтай - путь к дому!",
    duration: "~2 дн",
    distance: "240 км",
    cubeNumber: 3,
    img: "altai.png",
    user: "Михаил",
    userImage: "altai.png"));

final bottomNavIndexProvider = StateProvider<int>((ref) {
  if (ref.watch(userCompleteIntroductionProvider).state)
    return TRAVELLING_PAGE;
  else
    return TRAVELLING_PAGE;
  // return INTRODUCTION_PAGE;
});

final pageNameProvider = StateProvider<String?>((ref) {
  switch (ref.watch(bottomNavIndexProvider).state) {
    case TESTS_PAGE:
      {
        return TESTS_PAGE_NAME;
      }
    case CHAT_PAGE:
      {
        return CHAT_PAGE_NAME;
      }
    case GUIDES_PAGE:
      {
        return GUIDES_PAGE_NAME;
      }
    case PROFILE_PAGE:
      {
        return PROFILE_PAGE_NAME;
      }
    case TODO_PAGE:
      {
        return TODO_PAGE_NAME;
      }
    case TRAVELLING_PAGE:
      {
        return TRAVELLING_PAGE_NAME;
      }
  }
});
