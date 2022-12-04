import 'package:dahdi/views/PostsView.dart';
import 'package:go_router/go_router.dart';

import '../views/DetailsView.dart';
import '../views/LoginView.dart';

class AppRoute{
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        //builder: (context, state) => const LoginView(),
          builder: (context, state) => const PostsView(),
        routes:[
          GoRoute(
            path: 'post',
            builder: (context, state) => const PostsView(),
          ),
        ]
      ),
      GoRoute(
        path: '/D',
        builder: (context, state) => const DetailsView(),
      ),
    ],
  );
  get router => _router;
}





