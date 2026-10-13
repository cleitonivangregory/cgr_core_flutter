import 'package:cgr_core_flutter/cgr_core_flutter.dart';
import 'package:cgr_core_flutter/ui/core/view_models/splash_view_model.dart';

class CGRSplashScreen extends StatefulWidget {
  const new({
    super.key,
    required this.acronym,
    required this.appName,
    required this.nextScreen,
  });

  final String acronym;
  final String appName;
  final String nextScreen;

  @override
  State<CGRSplashScreen> createState() => _CGRSplashScreenState();
}

class _CGRSplashScreenState extends State<CGRSplashScreen> {
  late final CGRSplashViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = CGRSplashViewModel();
    viewModel.addListener(onStateChanged);
    viewModel.load();
  }

  @override
  void dispose() {
    viewModel.removeListener(onStateChanged);
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: Column(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Container(
                  width: 112,
                  height: 112,
                  alignment: .center,
                  decoration: BoxDecoration(
                    color: colors.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    widget.acronym,
                    // style: TextStyle(
                    //   color: colors.onPrimary,
                    //   fontSize: 20,
                    //   fontWeight: .bold,
                    // ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.appName,
                  // style: const TextStyle(fontSize: 20, fontWeight: .w600),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          ListenableBuilder(
            listenable: viewModel,
            builder: (context, child) {
              return Padding(
                padding: .symmetric(horizontal: 8, vertical: 4),
                child: LinearProgressIndicator(
                  value: viewModel.progress,
                  minHeight: 25,
                  // backgroundColor: Colors.grey.shade300,
                  // valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void onStateChanged() {
    if (viewModel.isSuccess) context.go(widget.nextScreen);
  }
}
