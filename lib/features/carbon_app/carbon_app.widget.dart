import 'package:carbon_flutter/features/theme/carbon_theme.style.dart';
import 'package:carbon_flutter/features/theme/carbon_theme.widget.dart';
import 'package:carbon_flutter/shared/index.dart';
import 'package:flutter/material.dart';

class CarbonApp extends StatelessWidget {
  CarbonApp({
    super.key,
    this.title = '',
    CarbonThemeData? theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.navigatorKey,
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.builder,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scaffoldMessengerKey,
    this.scrollBehavior,
  })  : theme = theme ?? CarbonThemeData.gray10(),
        routeInformationProvider = null,
        routeInformationParser = null,
        routerDelegate = null,
        routerConfig = null,
        backButtonDispatcher = null;

  CarbonApp.router({
    super.key,
    required RouterDelegate<Object> this.routerDelegate,
    required RouteInformationParser<Object> this.routeInformationParser,
    this.routeInformationProvider,
    this.routerConfig,
    this.backButtonDispatcher,
    this.title = '',
    CarbonThemeData? theme,
    this.darkTheme,
    this.highContrastTheme,
    this.highContrastDarkTheme,
    this.themeMode = ThemeMode.system,
    this.themeAnimationDuration = kThemeAnimationDuration,
    this.themeAnimationCurve = Curves.linear,
    this.builder,
    this.onGenerateTitle,
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scaffoldMessengerKey,
    this.scrollBehavior,
  })  : theme = theme ?? CarbonThemeData.gray10(),
        navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null;

  final CarbonThemeData theme;
  final CarbonThemeData? darkTheme;
  final CarbonThemeData? highContrastTheme;
  final CarbonThemeData? highContrastDarkTheme;
  final ThemeMode themeMode;
  final Duration themeAnimationDuration;
  final Curve themeAnimationCurve;

  final GlobalKey<NavigatorState>? navigatorKey;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
  final List<NavigatorObserver>? navigatorObservers;
  final TransitionBuilder? builder;
  final String title;
  final GenerateAppTitle? onGenerateTitle;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final LocaleListResolutionCallback? localeListResolutionCallback;
  final LocaleResolutionCallback? localeResolutionCallback;
  final Iterable<Locale> supportedLocales;
  final bool debugShowMaterialGrid;
  final bool showPerformanceOverlay;
  final bool checkerboardRasterCacheImages;
  final bool checkerboardOffscreenLayers;
  final bool showSemanticsDebugger;
  final bool debugShowCheckedModeBanner;
  final Map<LogicalKeySet, Intent>? shortcuts;
  final Map<Type, Action<Intent>>? actions;
  final String? restorationScopeId;
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;
  final ScrollBehavior? scrollBehavior;

  final RouteInformationProvider? routeInformationProvider;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouterDelegate<Object>? routerDelegate;
  final RouterConfig<Object>? routerConfig;
  final BackButtonDispatcher? backButtonDispatcher;

  bool get _usesRouter => routerDelegate != null;

  Brightness get systemBrightness => MediaQueryData.fromView(WidgetsBinding.instance.window).platformBrightness;

  @override
  Widget build(BuildContext context) {
    return _usesRouter
        ? MaterialApp.router(
            theme: getTheme(theme.style),
            darkTheme: getTheme(darkTheme?.style ?? CTheme.gray90),
            highContrastTheme: getTheme(highContrastTheme?.style ?? theme.style),
            highContrastDarkTheme: getTheme(highContrastDarkTheme?.style ?? darkTheme?.style ?? CTheme.gray90),
            themeMode: themeMode,
            themeAnimationCurve: themeAnimationCurve,
            themeAnimationDuration: themeAnimationDuration,
            routeInformationProvider: routeInformationProvider,
            routeInformationParser: routeInformationParser,
            routerDelegate: routerDelegate,
            routerConfig: routerConfig,
            backButtonDispatcher: backButtonDispatcher,
            builder: (context, child) => CarbonTheme(
              data: switch (themeMode) {
                ThemeMode.light => theme,
                ThemeMode.dark => darkTheme ?? theme,
                ThemeMode.system => systemBrightness == Brightness.light ? theme : (darkTheme ?? theme),
              },
              child: builder?.call(context, child) ?? child!,
            ),
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: color,
            locale: locale,
            localizationsDelegates: localizationsDelegates,
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            debugShowMaterialGrid: debugShowMaterialGrid,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            shortcuts: shortcuts,
            actions: actions,
            restorationScopeId: restorationScopeId,
            scaffoldMessengerKey: scaffoldMessengerKey,
            scrollBehavior: scrollBehavior,
          )
        : MaterialApp(
            theme: getTheme(theme.style),
            darkTheme: getTheme(darkTheme?.style ?? CTheme.gray90),
            highContrastTheme: getTheme(highContrastTheme?.style ?? theme.style),
            highContrastDarkTheme: getTheme(highContrastDarkTheme?.style ?? darkTheme?.style ?? CTheme.gray90),
            themeMode: themeMode,
            themeAnimationCurve: themeAnimationCurve,
            themeAnimationDuration: themeAnimationDuration,
            home: home,
            routes: routes ?? const {},
            navigatorKey: navigatorKey,
            initialRoute: initialRoute,
            onGenerateRoute: onGenerateRoute,
            onGenerateInitialRoutes: onGenerateInitialRoutes,
            onUnknownRoute: onUnknownRoute,
            navigatorObservers: navigatorObservers ?? const [],
            builder: (context, child) => CarbonTheme(
              data: switch (themeMode) {
                ThemeMode.light => theme,
                ThemeMode.dark => darkTheme ?? theme,
                ThemeMode.system => systemBrightness == Brightness.light ? theme : (darkTheme ?? theme),
              },
              child: builder?.call(context, child) ?? child!,
            ),
            title: title,
            onGenerateTitle: onGenerateTitle,
            color: color,
            locale: locale,
            localizationsDelegates: localizationsDelegates,
            localeListResolutionCallback: localeListResolutionCallback,
            localeResolutionCallback: localeResolutionCallback,
            supportedLocales: supportedLocales,
            debugShowMaterialGrid: debugShowMaterialGrid,
            showPerformanceOverlay: showPerformanceOverlay,
            checkerboardRasterCacheImages: checkerboardRasterCacheImages,
            checkerboardOffscreenLayers: checkerboardOffscreenLayers,
            showSemanticsDebugger: showSemanticsDebugger,
            debugShowCheckedModeBanner: debugShowCheckedModeBanner,
            shortcuts: shortcuts,
            actions: actions,
            restorationScopeId: restorationScopeId,
            scaffoldMessengerKey: scaffoldMessengerKey,
            scrollBehavior: scrollBehavior,
          );
  }
}
