import 'package:cgr_core_flutter/cgr_core_flutter.dart';
import 'package:cgr_core_flutter/ui/core/view_models/theme_view_model.dart';

class CGRThemeWidget extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CGRThemeViewModel>();

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, state) {
        return SwitchListTile(
          title: const Text('Tema escuro'),
          value: viewModel.isDarkTheme,
          onChanged: (bool isDark) => viewModel.toogleTheme(isDark: isDark),
        );
      },
    );
  }
}
