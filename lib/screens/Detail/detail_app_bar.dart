import 'package:flutter/material.dart';
import 'package:shop/constrains.dart';
import 'package:shop/models/product_models.dart';
import 'package:shop/provider/favorite._provider.dart';

class DetailAppBar extends StatelessWidget {
  final Product product;
  const DetailAppBar({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            iconSize: 30,
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          const Spacer(),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () {},
            iconSize: 30,
            icon: const Icon(
              Icons.share_outlined,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: kcontentColor,
              padding: const EdgeInsets.all(20),
            ),
            onPressed: () {
              provider.toggleFavorite(product);
            },
            iconSize: 30,
            icon: Icon(
              provider.isExists(product)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
