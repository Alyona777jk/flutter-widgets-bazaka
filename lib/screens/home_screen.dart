import 'package:flutter/material.dart';
import '../utils/app_state.dart';
import '../widgets/profile_widget.dart';
import '../widgets/custom_button.dart';
import '../widgets/animated_counter.dart';
import '../widgets/product_card.dart';
import '../widgets/custom_chart_widget.dart';

class HomeScreen extends StatelessWidget {
  final AppState appState;
  const HomeScreen({Key? key, required this.appState}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Widgets Showcase (14/14)'),
            actions: [Center(child: Padding(padding: const EdgeInsets.only(right: 16.0), child: Text('Кошик: ${appState.cartCount}')))],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('1. Profile Widget', style: TextStyle(fontWeight: FontWeight.bold)),
                ProfileWidget(user: appState.currentUser),
                const SizedBox(height: 16),
                const Text('🎁 BONUS: CustomPaint & Advanced Animation', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
                const Center(child: CustomChartWidget(progress: 0.85)),
                const SizedBox(height: 16),
                const Text('2. Custom Buttons', style: TextStyle(fontWeight: FontWeight.bold)),
                const Row(children: [CustomButton(text: 'Primary'), SizedBox(width: 8), CustomButton(text: 'Danger', style: CustomButtonStyle.danger)]),
                const SizedBox(height: 16),
                const Text('3. Animated Counter', style: TextStyle(fontWeight: FontWeight.bold)),
                const Center(child: AnimatedCounter()),
                const SizedBox(height: 16),
                const Text('4. Product Cards', style: TextStyle(fontWeight: FontWeight.bold)),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75),
                  itemCount: appState.products.length,
                  itemBuilder: (context, index) {
                    final product = appState.products[index];
                    return ProductCard(
                      product: product,
                      onFavoriteToggle: () => appState.toggleFavorite(product),
                      onAddToCart: () => appState.addToCart(product),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
