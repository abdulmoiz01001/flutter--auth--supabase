import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:loginsignup/Stacks/User/Controllers/home_controller1.dart';
import 'package:loginsignup/Stacks/User/Pages/product_card_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildSaleHeader(),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height *
                    .3, // fixed height for product cards
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ProductCardScreen(productDetails: product)));
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * .4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                clipBehavior: Clip.hardEdge,
                                child: Stack(
                                  children: [
                                    Image.network(
                                      product.image,
                                      width: 120,
                                      height: 120,
                                      fit: BoxFit.contain,
                                    ),
                                    Positioned(
                                      top: 5,
                                      left: 5,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 2),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Text(
                                          "20% OFF",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 14,
                                        child: Icon(
                                          Icons.favorite_border,
                                          size: 16,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: RatingBarIndicator(
                                  rating: product.rating,
                                  itemBuilder: (context, index) =>
                                      Icon(Icons.star, color: Colors.amber),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  unratedColor: Colors.amber.withAlpha(50),
                                ),
                              ),
                              Text(
                                product.category,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(product.title,
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                              Text(
                                "\$${product.price}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: _buildNewHeader(),
            ),
            Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return SizedBox(
                height: MediaQuery.of(context).size.height *
                    .3, // fixed height for product cards
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true, // <--- This flips the list!
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: Stack(
                                children: [
                                  Image.network(
                                    product.image,
                                    width: 120,
                                    height: 120,
                                    fit: BoxFit.contain,
                                  ),
                                  Positioned(
                                    top: 5,
                                    left: 5,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        "NEW",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    right: 5,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 14,
                                      child: Icon(
                                        Icons.favorite_border,
                                        size: 16,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: RatingBarIndicator(
                                rating: 0,
                                itemBuilder: (context, index) =>
                                    Icon(Icons.star, color: Colors.amber),
                                itemCount: 5,
                                itemSize: 20.0,
                                unratedColor: Colors.amber.withAlpha(50),
                              ),
                            ),
                            Text(
                              product.category,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(product.title,
                                maxLines: 1, overflow: TextOverflow.ellipsis),
                            Text(
                              "\$${product.price}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: [
          Image.asset(
            "assets/images/home_screen_img.webp",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.0,
                colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                stops: [0.6, 1.0],
              ),
            ),
          ),
          Center(
            child: Text(
              "Welcome To Store",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSaleHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Sale",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
            Text("Super summer sale", style: TextStyle(color: Colors.grey)),
          ],
        ),
        Text("View all",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

Widget _buildNewHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("New",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
          Text("You've never seen it before",
              style: TextStyle(color: Colors.grey)),
        ],
      ),
      Text("View all",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
    ],
  );
}
