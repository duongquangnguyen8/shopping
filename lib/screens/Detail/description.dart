import 'package:flutter/material.dart';
import 'package:shop/constrains.dart';

class Description extends StatelessWidget {
  final String description;
  const Description({super.key, required this.description});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: kprimaryColor,
              ),
              alignment: Alignment.center,
              child: const Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Text(
              'Specifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              'Specifications',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 88, 87, 87),
          ),
        )
      ],
    );
  }
}
