import 'package:cgr_core_flutter/cgr_core_flutter.dart';
import 'package:cgr_core_flutter/ui/core/view_models/theme_view_model.dart';

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
    return ChangeNotifierProvider(
      create: (context) => CGRThemeViewModel(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: theme,
            darkTheme: darkTheme,
            themeMode: context.watch<CGRThemeViewModel>().themeMode,
            routerConfig: routerConfig,
          );
        },
      ),
    );
  }
}
