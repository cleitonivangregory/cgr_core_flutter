import 'package:cgr_core_flutter/cgr_core_flutter.dart';

class CGRApp extends StatelessWidget {
  const new({super.key, required this.routerConfig});

  final GoRouter routerConfig;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig,
    );
  }
}
