import 'package:cgr_core_flutter/cgr_core_flutter.dart';

class CGRApp extends StatelessWidget {
  const new({
    super.key,
    this.theme,
    this.darkTheme,
    required this.routerConfig,
  });

  final ThemeData? theme;
  final ThemeData? darkTheme;
  final GoRouter routerConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: darkTheme,
      themeMode: .system,
      routerConfig: routerConfig,
    );
  }
}
