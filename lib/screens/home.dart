import 'package:boutique/widgets/filter_widget.dart';
import 'package:boutique/widgets/products_widget.dart';
import 'package:flutter/material.dart';

import '../consts/product_consts.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMenuVisible = false;

  void toggleMenuVisibility() {
    setState(() {
      isMenuVisible = !isMenuVisible;
    });
  }

  void dismissMenu() {
    if (isMenuVisible) {
      toggleMenuVisibility();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Container(
                  color: Colors.black,
                  height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Text(
                    'Cashback 10% + Delivery Discount',
                    style: TextStyle(
                      letterSpacing: 0.001,
                      color: Colors.white,
                    ),
                  ),
                ),
                AppBar(
                  elevation: 0.5,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  title: Text(
                    'Shoop',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                          letterSpacing: 0.001,
                        ),
                  ),
                  automaticallyImplyLeading: false,
                  actions: [
                    Icon(Icons.shopping_bag_outlined,
                        color: Theme.of(context).colorScheme.secondary),
                    const SizedBox(width: 7),
                    Icon(Icons.star_border,
                        color: Theme.of(context).colorScheme.secondary),
                    const SizedBox(width: 7),
                    GestureDetector(
                      onTap: toggleMenuVisibility,
                      child: Icon(
                        Icons.menu,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Text(
                          'FEATURED ITEMS',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontSize: 23),
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: GridView.count(
                                shrinkWrap: true,
                                physics: isMenuVisible
                                    ? const NeverScrollableScrollPhysics()
                                    : null,
                                crossAxisCount: 2,
                                childAspectRatio: 0.6,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 5,
                                children: List.generate(
                                  prodInfo.length,
                                  (index) {
                                    return GestureDetector(
                                      onTap: dismissMenu,
                                      child: ProductWidget(
                                        imgPath: prodInfo[index]['imgPath'],
                                        prodName: prodInfo[index]['prodName'],
                                        brand: prodInfo[index]['brand'],
                                        price: prodInfo[index]['price'],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            if (isMenuVisible)
                              Positioned.fill(
                                child: Container(
                                  color: Colors.transparent,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isMenuVisible)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: FilterWidget(
                onDismiss: toggleMenuVisibility,
              ),
            )
        ],
      ),
    );
  }
}
