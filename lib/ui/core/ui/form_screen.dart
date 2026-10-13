import 'package:cgr_core_flutter/cgr_core_flutter.dart';

class CGRFormScreen extends StatelessWidget {
  new({
    super.key,
    required this.viewModel,
    required this.children,
  });

  final CGRFormViewModel viewModel;
  final List<Widget> children;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(viewModel.isEdit ? 'Editar' : 'Novo')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(child: Column(children: children)),
      ),
      bottomNavigationBar: CGRInfinityButton(
        label: 'Salvar',
        onPressed: () async {
          if (!_formKey.currentState!.validate()) return;

          try {
            await viewModel.save();
            if (!context.mounted) return;
            context.pop(true);
          } catch (e) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Não foi possível salvar.')),
            );
          }
        },
      ),
    );
  }
}
