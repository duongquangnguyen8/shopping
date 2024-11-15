import 'package:flutter/material.dart';
import 'package:shop/constrains.dart';
import 'package:shop/models/product_models.dart';
import 'package:shop/screens/Home/Widget/catefory.dart';
import 'package:shop/screens/Home/Widget/home_app_bar.dart';
import 'package:shop/screens/Home/Widget/image_slider.dart';
import 'package:shop/screens/Home/Widget/product_cart.dart';
import 'package:shop/screens/Home/Widget/search_bar.dart';

class HomeScreens extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    List<List<Product>> selectedCategory = [all,shoes];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              CustomAppBar(),
              const SizedBox(
                height: 10,
              ),
              const MySearchBar(),
              const SizedBox(
                height: 10,
              ),
              ImageSlider(
                  currentSlide: currentSlider,
                  onChange: (value) {
                    setState(() {
                      currentSlider = value;
                    });
                  }),
              const SizedBox(
                height: 8,
              ),
              Categories(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Special For You',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                  ),
                  Spacer(), //cho nó căn ra giữa
                  Text(
                    'See All',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ],
              ),
              GridView.builder(
                physics:
                    const NeverScrollableScrollPhysics(), // ngăn grid cuộng độc lập
                shrinkWrap: true, //đảm bảo vừa đủ nội dung
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.78,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: all.length,
                itemBuilder: (context, index) {
                  return ProductCart(product: all[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
