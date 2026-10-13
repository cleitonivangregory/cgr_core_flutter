import 'package:cgr_core_flutter/cgr_core_flutter.dart';

class CGRBottomButton extends StatelessWidget {
  const new({super.key, required this.label, this.onPressed});

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: .symmetric(horizontal: 8),
      child: SizedBox(
        width: double.infinity,
        child: FilledButton(onPressed: onPressed, child: Text(label)),
      ),
    );
  }
}
