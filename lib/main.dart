import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'auth/firebase_auth/firebase_user_provider.dart';
import 'auth/firebase_auth/auth_util.dart';

import 'backend/firebase/firebase_config.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  GoRouter.optionURLReflectsImperativeAPIs = true;
  usePathUrlStrategy();

  await initFirebase();

  await FlutterFlowTheme.initialize();

  final appState = FFAppState(); // Initialize FFAppState
  await appState.initializePersistedState();

  runApp(ChangeNotifierProvider(
    create: (context) => appState,
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  late Stream<BaseAuthUser> userStream;

  final authUserSub = authenticatedUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();

    _appStateNotifier = AppStateNotifier.instance;
    _router = createRouter(_appStateNotifier);
    userStream = harpFirebaseUserStream()
      ..listen((user) {
        _appStateNotifier.update(user);
      });
    jwtTokenStream.listen((_) {});
    Future.delayed(
      const Duration(milliseconds: 1000),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();

    super.dispose();
  }

  void setThemeMode(ThemeMode mode) => safeSetState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'harp',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(
        brightness: Brightness.light,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: WidgetStateProperty.all(false),
          trackVisibility: WidgetStateProperty.all(false),
          interactive: false,
          thickness: WidgetStateProperty.all(4.0),
          radius: const Radius.circular(2.0),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.dragged)) {
              return const Color(0x8032cc35);
            }
            if (states.contains(WidgetState.hovered)) {
              return const Color(0x8032cc35);
            }
            return const Color(0x8032cc35);
          }),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: WidgetStateProperty.all(false),
          trackVisibility: WidgetStateProperty.all(false),
          interactive: false,
          thickness: WidgetStateProperty.all(4.0),
          radius: const Radius.circular(2.0),
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.dragged)) {
              return const Color(0x8032cc35);
            }
            if (states.contains(WidgetState.hovered)) {
              return const Color(0x8032cc35);
            }
            return const Color(0x8032cc35);
          }),
        ),
      ),
      themeMode: _themeMode,
      routerConfig: _router,
    );
  }
}

class NavBarPage extends StatefulWidget {
  const NavBarPage({super.key, this.initialPage, this.page});

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'landingModeSELECT';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'landingModeSELECT': const LandingModeSELECTWidget(),
      'fresh': const FreshWidget(),
      'fresh2': const Fresh2Widget(),
      'FRESH_ENC': const FreshEncWidget(),
      'Onboarding': const OnboardingWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    final MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      body: MediaQuery(
          data: queryData
              .removeViewInsets(removeBottom: true)
              .removeViewPadding(removeBottom: true),
          child: _currentPage ?? tabs[_currentPageName]!),
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => safeSetState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: FlutterFlowTheme.of(context).secondary,
        selectedItemColor: const Color(0x8032CC35),
        unselectedItemColor: const Color(0x84E3E3E3),
        selectedBackgroundColor: const Color(0x0D000000),
        borderRadius: 1.0,
        itemBorderRadius: 1.0,
        margin: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        width: 400.0,
        elevation: 2.0,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color:
                      currentIndex == 0 ? const Color(0x8032CC35) : const Color(0x84E3E3E3),
                  size: 24.0,
                ),
                Text(
                  'Home',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 0
                        ? const Color(0x8032CC35)
                        : const Color(0x84E3E3E3),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline_sharp,
                  color:
                      currentIndex == 1 ? const Color(0x8032CC35) : const Color(0x84E3E3E3),
                  size: 24.0,
                ),
                Text(
                  '_fresh',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 1
                        ? const Color(0x8032CC35)
                        : const Color(0x84E3E3E3),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color:
                      currentIndex == 2 ? const Color(0x8032CC35) : const Color(0x84E3E3E3),
                  size: 24.0,
                ),
                Text(
                  '_decrypt',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 2
                        ? const Color(0x8032CC35)
                        : const Color(0x84E3E3E3),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color:
                      currentIndex == 3 ? const Color(0x8032CC35) : const Color(0x84E3E3E3),
                  size: 24.0,
                ),
                Text(
                  '_freshenc',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: currentIndex == 3
                        ? const Color(0x8032CC35)
                        : const Color(0x84E3E3E3),
                    fontSize: 11.0,
                  ),
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color:
                      currentIndex == 4 ? const Color(0x8032CC35) : const Color(0x84E3E3E3),
                  size: 24.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
