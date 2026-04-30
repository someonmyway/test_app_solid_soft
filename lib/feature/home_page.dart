import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_solid_soft/feature/home_view_model.dart';
import 'package:test_app_solid_soft/feature/widgets/color_history.dart';
import 'package:test_app_solid_soft/feature/widgets/color_info.dart';

/// A widget representing the home page of the app.
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(),
      child: const HomeView(),
    );
  }
}

/// A widget representing the main content of the home page.
class HomeView extends StatelessWidget {
  /// Creates a [HomeView] widget.
  const HomeView();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      body: SizedBox.expand(
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: viewModel.changeBackgroundColor,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            color: viewModel.backgroundColor,
            child: Column(
              children: [
                const Spacer(),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Hello there",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 12),
                    ColorInfo(
                      color: viewModel.backgroundColor,
                      hex: viewModel.currentColorHex,
                    ),
                  ],
                ),

                const Spacer(),

                ColorHistory(history: viewModel.history),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
