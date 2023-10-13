import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/prodDetails';
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<String> images = [
    'assets/images/onboarding_5.jpeg',
    'assets/images/onboarding_5.jpeg',
    'assets/images/onboarding_5.jpeg',
    'assets/images/onboarding_5.jpeg',
  ];
  final PageController pageController = PageController();
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            children: images.asMap().entries.map((entry) {
              final index = entry.key;
              final image = entry.value;
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: index == current ? 0.0 : 10.0,
                ),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              );
            }).toList(),
            onPageChanged: (index) {
              setState(() {
                current = index;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 80, 0, 0),
            child: Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 24,
                  backgroundColor:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.65),
                  child: Icon(Icons.arrow_back,
                      color: Theme.of(context).colorScheme.primary, size: 25),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: 80,
                          height: 2,
                          color: current == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.8),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
