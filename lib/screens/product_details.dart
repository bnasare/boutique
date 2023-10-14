import 'package:flutter/material.dart';

import '../consts/product_consts.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = '/prodDetails';
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                              : Colors.grey[500],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.41,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: const Text(
                        'H&M - Buy 3 get 40% discount',
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.001,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: Text(
                        'Regular Fit Oxford Shirt',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 23),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 0, 0),
                      child: Text(
                        'H&M, men shirt',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            letterSpacing: 0.001,
                            color: Colors.grey[500],
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        children: [
                          Icon(Icons.circle,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 40),
                          const SizedBox(width: 5),
                          Icon(Icons.circle,
                              color: Theme.of(context).colorScheme.tertiary,
                              size: 40),
                          const SizedBox(width: 5),
                          Icon(Icons.circle, color: Colors.grey[300], size: 40),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey[300]!),
                                borderRadius: BorderRadius.circular(7)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.remove, color: Colors.grey[300]!),
                                Text('1',
                                    style:
                                        Theme.of(context).textTheme.bodySmall),
                                Icon(Icons.add, color: Colors.grey[300]!)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Select Size',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 15)),
                          Text(
                            'Size guide',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 13,
                                      decoration: TextDecoration.underline,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sizeTexts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 0),
                            margin: EdgeInsets.only(
                              top: 18,
                              bottom: 18,
                              left: index == 0 ? 20.0 : 0.0,
                              right:
                                  index == sizeTexts.length - 1 ? 20.0 : 10.0,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: Colors.grey[300]!)),
                            alignment: Alignment.center,
                            child: Text(
                              sizeTexts[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontSize: 15),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$12.07',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontSize: 23),
                          ),
                          Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.tertiary,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child: Text('Buy one',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(fontSize: 17)),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
