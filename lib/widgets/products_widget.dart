import 'package:boutique/screens/product_details.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.prodName,
    required this.brand,
    required this.imgPath,
    required this.price,
  }) : super(key: key);

  final String prodName, brand, imgPath;
  final double price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ProductDetails.routeName);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imgPath),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              prodName,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.secondary,
                  letterSpacing: 0.001,
                  fontSize: 18),
            ),
          ),
          Text(
            brand,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                letterSpacing: 0.001, color: Colors.grey[500], fontSize: 14),
          ),
          Text(
            '\$ ${price.toStringAsFixed(2)}',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
                letterSpacing: 0.001,
                fontSize: 18),
          ),
        ],
      ),
    );
  }
}
