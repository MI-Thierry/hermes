import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'features/auth/auth_state_provider.dart';
import 'features/auth/create_account_page.dart';
import 'features/auth/login_page.dart';
import 'features/auth/welcome_cards_page.dart';
import 'package:provider/provider.dart';
import 'features/cart/cart_page.dart';
import 'features/categories/categories_page.dart';
import 'features/home/home_page.dart';
import 'features/profile/profile_page.dart';
import 'features/wishlist/wishlist_page.dart';
import 'features/shared/layout_scaffold.dart';

class App extends StatelessWidget {
  const App({super.key});

  GoRouter _getRouter(AuthStateProvider provider) {
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthStateProvider>(context);
    return MaterialApp.router(
      routerConfig: _getRouter(provider),
      title: 'HermGen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[100]!),
        textTheme: TextTheme(
          titleLarge: GoogleFonts.raleway(
            fontSize: 52,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: GoogleFonts.raleway(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.raleway(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: GoogleFonts.nunitoSans(
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
          bodyMedium: GoogleFonts.nunitoSans(fontSize: 14),
          bodySmall: GoogleFonts.nunitoSans(fontSize: 10),
          labelLarge: GoogleFonts.nunitoSans(
            fontSize: 22,
            fontWeight: FontWeight.w200,
          ),
          labelMedium: GoogleFonts.nunitoSans(
            fontSize: 15,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
