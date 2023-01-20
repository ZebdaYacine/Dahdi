import 'package:dahdi/ui/views/DetailsView.dart';
import 'package:dahdi/ui/views/LoginView.dart';
import 'package:dahdi/ui/views/PostsView.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
        //builder: (context, state) => const PostsView(),
        routes: [
          GoRoute(
            path: 'post',
            builder: (context, state) => const PostsView(),
          ),
        ],
      ),
      GoRoute(
        path: "/detailsPost",
        builder: (context, state) => DetailsView(id: state.extra.toString()!),
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) => const LoginView(),
      ),
    ],
  );

  get router => _router;
}
