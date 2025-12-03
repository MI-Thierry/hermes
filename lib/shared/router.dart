import 'package:go_router/go_router.dart';
import 'package:hermes/features/auth/start_page.dart';
import '../features/auth/auth_state_provider.dart';
import '../features/auth/create_account_page.dart';
import '../features/auth/login_page.dart';
import '../features/auth/welcome_cards_page.dart';
import '../features/cart/cart_page.dart';
import '../features/categories/categories_page.dart';
import '../features/home/home_page.dart';
import '../features/profile/profile_page.dart';
import '../features/wishlist/wishlist_page.dart';
import 'layout_scaffold.dart';

GoRouter getRouter(AuthStateProvider provider) {
  return GoRouter(
    redirect: (context, state) async {
      var authState = await provider.getAuthenticationState();
      final bool isAuthorized = authState.isAuthorized;
      final bool loggingIn = state.matchedLocation == '/login';
      if (!isAuthorized && !loggingIn) {
        return '/login'; // Redirect to login page
      }
      if (isAuthorized && loggingIn) {
        return '/'; // Redirect to home if already logged in and trying to access login
      }
      return null; // No redirection needed
    },
    refreshListenable: provider,
    routes: [
      GoRoute(path: '/login', builder: (context, state) => LoginPage()),
      GoRoute(
        path: '/signup',
        builder: (context, state) => CreateAccountPage(),
      ),
      GoRoute(
        path: '/welcome',
        builder: (context, state) => WelcomeCardsPage(),
      ),
      GoRoute(path: '/start', builder: (context, state) => StartPage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            LayoutScaffold(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            initialLocation: '/',
            routes: [
              GoRoute(path: '/', builder: (context, state) => HomePage()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/wishlist',
                builder: (context, state) => WishlistPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/categories',
                builder: (context, state) => CategoriesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/cart', builder: (context, state) => CartPage()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/profile',
                builder: (context, state) => ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
