import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:loginsignup/Stacks/User/Controllers/home_controller1.dart';
import 'package:loginsignup/Stacks/User/Controllers/product_color_controller.dart';
import 'package:loginsignup/Stacks/User/Controllers/product_size_controller.dart';

class ProductCardScreen extends StatefulWidget {
  final productDetails;
  const ProductCardScreen({super.key, required this.productDetails});

  @override
  State<ProductCardScreen> createState() => _ProductCardScreenState();
}

class _ProductCardScreenState extends State<ProductCardScreen> {
  final HomeController controller = Get.put(HomeController());
  final ProductSizeController sizeController = Get.put(ProductSizeController());
  final ProductColorController colorController =
      Get.put(ProductColorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        title: Text(widget.productDetails.title),
        actions: [
          Icon(Icons.share),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .55,
                  child: Image.network(widget.productDetails.image,
                      fit: BoxFit.cover),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            // Optional: To avoid layout overflow
                            child: Obx(() {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: sizeController.selectedSize.value,
                                    hint: Text(
                                      sizeController.selectedSize.value ??
                                          'Select Size',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    items: sizeController.sizes.map((String size) {
                                      return DropdownMenuItem<String>(
                                        value: size,
                                        child: Text(
                                          size,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: sizeController.changeSize,
                                    icon: Icon(Icons.arrow_drop_down,
                                        color: const Color.fromRGBO(0, 0, 0, 1)),
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              
                              );
                            }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            // Optional: To avoid layout overflow
                            child: Obx(() {
                              return Container(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: colorController.selectedColor.value,
                                    hint: Text(
                                      colorController.selectedColor.value ??
                                          'Select Color',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                    items: colorController.colors
                                        .map((String size) {
                                      return DropdownMenuItem<String>(
                                        value: size,
                                        child: Text(
                                          size,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: colorController.changeColor,
                                    icon: Icon(Icons.arrow_drop_down,
                                        color: Colors.black),
                                    isExpanded: true,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            padding: EdgeInsets.all(
                                8), // Optional: for inner spacing
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                            child: Icon(Icons.favorite_border),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Text(
                              widget.productDetails.title,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "\$${widget.productDetails.price}",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.productDetails.category,
                            style: TextStyle(color: Colors.grey),
                          ),
                          RatingBarIndicator(
                            rating: widget.productDetails.rating,
                            itemBuilder: (context, index) =>
                                Icon(Icons.star, color: Colors.amber),
                            itemCount: 5,
                            itemSize: 20.0,
                            unratedColor: Colors.amber.withAlpha(50),
                          ),
                          Text(
                            widget.productDetails.description,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Sticky Draggable Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.17,
            minChildSize: 0.1,
            maxChildSize: 0.5,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -4),
                    ),
                  ],
                ),
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Add to Cart
                          // You can add Get.snackbar or any state logic
                          print("Added to cart");
                          Get.snackbar("Success", "Product added to cart",
                              backgroundColor: Colors.greenAccent,
                              colorText: Colors.black);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text("ADD TO CART",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                  
                    SizedBox(height: 20),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    ListTile(
                      title: Text("Shipping info"),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    ListTile(
                      title: Text("Support"),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                    Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                    // Optionally, you can add: "You can also like..." section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: _buildRecomendationsHeader(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Obx(() {
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  borderRadius:
                                                      BorderRadius.circular(4),
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: RatingBarIndicator(
                                          rating: 0,
                                          itemBuilder: (context, index) => Icon(
                                              Icons.star,
                                              color: Colors.amber),
                                          itemCount: 5,
                                          itemSize: 20.0,
                                          unratedColor:
                                              Colors.amber.withAlpha(50),
                                        ),
                                      ),
                                      Text(
                                        product.category,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      Text(product.title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
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
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildRecomendationsHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("You can also like this",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        ],
      ),
      Text("12 items",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
    ],
  );
}
