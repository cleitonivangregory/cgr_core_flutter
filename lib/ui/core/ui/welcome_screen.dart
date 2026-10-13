import 'package:cgr_core_flutter/cgr_core_flutter.dart';

class CGRWelcomeScreen extends StatelessWidget {
  const new({super.key, required this.nextScreen});

  final String nextScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Welcome')),
      bottomNavigationBar: CGRBottomButton(
        label: 'Continuar',
        onPressed: () => context.go(nextScreen),
      ),
    );
  }
}
