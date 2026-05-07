import 'package:experience_app/features/create_prototype/presentation/views/create_view.dart';
import 'package:experience_app/features/create_prototype/presentation/views/personalize_experience.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.createPrototype,
      path: '/',
      builder: (context, state) => CreateView(),
    ),
    GoRoute(
      name: Routes.personalizeExperience,
      path: '/personalize_experience',
      builder: (context, state) => PersonalizeExperience(),
    ),
  ],
);

abstract class Routes {
  static const String createPrototype = 'create_prototype';
  static const String personalizeExperience = 'personalize_experience';
}
