import 'dart:ui';

import 'package:flutter/material.dart';

import '../consts/product_consts.dart';

class FilterWidget extends StatefulWidget {
  final VoidCallback onDismiss;

  const FilterWidget({
    super.key,
    required this.onDismiss,
  });

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2.5, sigmaY: 2.5),
      child: Container(
        margin: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 15),
                child: GestureDetector(
                  onTap: () {
                    widget.onDismiss(); // Call the onDismiss callback
                  },
                  child: Icon(
                    Icons.close,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Filter',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  ),
                  Text(
                    'Select options to dig more',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
              child: Divider(
                height: 30,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 25, right: 5),
              title: const Text(
                'Colors',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 17,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  for (int index = 0; index < customColors.length; index++)
                    Expanded(
                      child: Icon(
                        Icons.circle,
                        color: customColors[index],
                        size: 40,
                      ),
                    ),
                ],
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 25, right: 5),
              title: const Text(
                'Category',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 17,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catergoryText.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    margin: EdgeInsets.only(
                      left: index == 0 ? 25.0 : 0.0,
                      right: index == catergoryText.length - 1 ? 25.0 : 10.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.grey[300]!)),
                    alignment: Alignment.center,
                    child: Text(
                      catergoryText[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 15),
                    ),
                  );
                },
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 25, right: 5),
              title: const Text(
                'Brands',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 17,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brandText.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                    margin: EdgeInsets.only(
                      left: index == 0 ? 25.0 : 0.0,
                      right: index == brandText.length - 1 ? 25.0 : 10.0,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(color: Colors.grey[300]!)),
                    alignment: Alignment.center,
                    child: Text(
                      brandText[index],
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 15),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 13),
            Center(
              child: Text('Show advanced filter',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 13, decoration: TextDecoration.underline)),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(25, 18, 25, 15),
              width: double.infinity,
              height: 45,
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
      ),
    );
  }
}
