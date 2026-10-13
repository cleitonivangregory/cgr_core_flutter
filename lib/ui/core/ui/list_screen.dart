import 'package:cgr_core_flutter/cgr_core_flutter.dart';

class CGRListScreen<T> extends StatefulWidget {
  const new({
    super.key,
    required this.title,
    required this.viewModel,
    required this.nextScreen,
  });

  final String title;
  final CGRListViewModel viewModel;
  final String nextScreen;

  @override
  State<CGRListScreen<T>> createState() => _CGRListScreenState<T>();
}

class _CGRListScreenState<T> extends State<CGRListScreen<T>> {
  @override
  void initState() {
    super.initState();

    widget.viewModel.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (context, state) => body,
      ),
      bottomNavigationBar: CGRInfinityButton(
        label: 'Adicionar',
        onPressed: () async {
          await context.push(widget.nextScreen);
          widget.viewModel.load();
        },
      ),
    );
  }

  Widget get body {
    if (widget.viewModel.isLoading) {
      return Center(child: CircularProgressIndicator());
    } else if (widget.viewModel.isSuccess) {
      if (widget.viewModel.items.isEmpty) {
        return Center(child: Text('Nenhum registro encontrado.'));
      }

      return RefreshIndicator(
        onRefresh: widget.viewModel.load,
        child: ListView.builder(
          itemCount: widget.viewModel.items.length,
          itemBuilder: (context, index) {
            final item = widget.viewModel.items[index];
            return Card(
              child: ListTile(
                onTap: () {},
                onLongPress: () {
                  widget.viewModel.remove(item: item);
                },
                leading: Text('$index'),
              ),
            );
          },
        ),
      );
    } else if (widget.viewModel.isError) {
      return Column(
        mainAxisAlignment: .center,
        children: [
          Text('Algo inesperado aconteceu...'),
          SizedBox(height: 16),
          CGRInfinityButton(
            label: 'Tentar novamente',
            onPressed: widget.viewModel.load,
          ),
        ],
      );
    }

    return SizedBox.shrink();
  }
}
