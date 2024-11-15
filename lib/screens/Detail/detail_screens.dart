import 'package:flutter/material.dart';

import 'package:shop/constrains.dart';
import 'package:shop/models/product_models.dart';
import 'package:shop/screens/Detail/addto_cart.dart';
import 'package:shop/screens/Detail/description.dart';
import 'package:shop/screens/Detail/detail_app_bar.dart';
import 'package:shop/screens/Detail/image_slider_detail.dart';
import 'package:shop/screens/Detail/item_detail.dart';

class DetailScreens extends StatefulWidget {
  final Product product;
  const DetailScreens({
    Key? key,
    required this.product,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreens> {
  int currentImage = 0;
  int currentSlide = 0;
  int cunrrentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      floatingActionButton: AddtoCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DetailAppBar(
                product: widget.product,
              ),
              MyImageSlider(
                  image: widget.product.image,
                  onChange: (index) {
                    setState(() {
                      currentImage = index;
                    });
                  }),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    5,
                    (index) => AnimatedContainer(
                          duration: const Duration(microseconds: 300),
                          width: currentSlide == index ? 15 : 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentSlide == index
                                ? Colors.black
                                : Colors.transparent,
                          ),
                        )),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40)),
                ),
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ItemDetail(product: widget.product),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Color',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        children: List.generate(
                      widget.product.colors.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            cunrrentColor = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: cunrrentColor == index
                                ? Colors.white
                                : widget.product.colors[index],
                            border: cunrrentColor == index
                                ? Border.all(
                                    color: widget.product.colors[index],
                                  )
                                : null,
                          ),
                          padding: cunrrentColor == index
                              ? const EdgeInsets.all(2)
                              : null,
                          margin: EdgeInsets.only(right: 15),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: widget.product.colors[index],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    Description(description: widget.product.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
