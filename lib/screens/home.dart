import 'package:boutique/widgets/products_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> prodInfo = [
      {
        'imgPath': 'assets/images/onboarding_5.jpeg',
        'prodName': 'Classic Leather Jacket',
        'brand': 'ZARA',
        'price': 79.99,
      },
      {
        'imgPath': 'assets/images/onboarding_5.jpeg',
        'prodName': 'Denim Skinny Jeans',
        'brand': 'H&M',
        'price': 39.95,
      },
      {
        'imgPath': 'assets/images/onboarding_5.jpeg',
        'prodName': 'Fit Resort Shirt',
        'brand': 'UNIQLO',
        'price': 26.51,
      },
      {
        'imgPath': 'assets/images/onboarding_5.jpeg',
        'prodName': 'Fit Linen-Clend Shirt',
        'brand': 'H&M',
        'price': 34.56,
      },
      {
        'imgPath': 'assets/images/onboarding_5.jpeg',
        'prodName': 'Lyocell short-sleeves',
        'brand': 'UNIQLO',
        'price': 34.56,
      },
      {
        'imgPath': 'assets/images/onboarding_5.jpeg',
        'prodName': 'Twill overshirt',
        'brand': 'UNIQLO',
        'price': 34.56,
      },
      {
        'imgPath': 'assets/images/onboarding_5.jpeg',
        'prodName': 'Slim Fit Jeans',
        'brand': 'Levi\'s',
        'price': 49.99,
      },
      {
        'imgPath': 'assets/images/onboarding_5.jpeg',
        'prodName': 'Classic Oxford Shirt',
        'brand': 'Brooks Brothers',
        'price': 59.99,
      },
      {
        'imgPath': 'assets/images/onboarding_5.jpeg',
        'prodName': 'Summer Linen Dress',
        'brand': 'ZARA',
        'price': 39.99,
      },
      {
        'imgPath': 'assets/images/onboarding_5.jpeg',
        'prodName': 'Cotton V-Neck Sweater',
        'brand': 'Gap',
        'price': 29.99,
      },
    ];

    return Scaffold(
      body: SafeArea(
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
                    letterSpacing: 0.001),
              ),
              automaticallyImplyLeading: false,
              actions: [
                Icon(Icons.shopping_bag_outlined,
                    color: Theme.of(context).colorScheme.secondary),
                const SizedBox(width: 7),
                Icon(Icons.star_border,
                    color: Theme.of(context).colorScheme.secondary),
                const SizedBox(width: 7),
                Icon(Icons.menu,
                    color: Theme.of(context).colorScheme.secondary),
                const SizedBox(width: 20),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Text(
                        'FEATURED ITEMS',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 23),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 5,
                      children: List.generate(
                        prodInfo.length,
                        (index) {
                          return ProductWidget(
                            imgPath: prodInfo[index]['imgPath'],
                            prodName: prodInfo[index]['prodName'],
                            brand: prodInfo[index]['brand'],
                            price: prodInfo[index]['price'],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
