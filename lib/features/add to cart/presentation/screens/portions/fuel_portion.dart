import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gaspay_mobile/core/presentation/theme/colors/colors.dart';
import '../../../../../core/presentation/manager/global_comment_controller.dart';
import '../../../../../core/presentation/widgets/button.dart';
import '../../../../checkout/presentation/screens/check_out_screen.dart';
import '../../widgets/reusable_fuel_container.dart';

class FuelPortion extends StatefulWidget {
  const FuelPortion({super.key});

  @override
  State<FuelPortion> createState() => _FuelPortionState();
}

class _FuelPortionState extends State<FuelPortion> {
  static List<Product> newCart = [];
  bool isSearch = false;
  double totalAmount = 0;

  void updatePrice() {
    totalAmount = 0;
    for (var product in newCart) {
      totalAmount += product.quantity * product.price;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: Product.allProducts.length,
                itemBuilder: (context, index) {
                  return ReusableFuelContainer(
                    product: Product.allProducts[index],
                    addToCart: () {
                      setState(() {
                        Product.allProducts[index].addedToCart = true;
                        Product.allProducts[index].quantity = 1;
                        newCart.add(Product.allProducts[index]);
                        updatePrice();
                      });
                    },
                    addQuantity: () {
                      setState(() {
                        Product.allProducts[index].quantity++;
                        updatePrice();
                      });
                    },
                    removeQuantity: () {
                      setState(() {
                        if (Product.allProducts[index].quantity > 1) {
                          Product.allProducts[index].quantity--;
                          updatePrice();
                        } else {
                          Product.allProducts[index].addedToCart = false;
                          newCart.remove(Product.allProducts[index]);
                          updatePrice();
                        }
                      });
                    },
                  );
                }),
          ),
          if (newCart.isNotEmpty)
            Container(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 40,
                top: 28,
              ),
              decoration:
                  BoxDecoration(color: theme.colorScheme.surface, boxShadow: [
                BoxShadow(
                  color: colorBlack.withOpacity(0.25),
                  blurRadius: 18,
                  offset: const Offset(0, 2),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Order Total(${newCart.length})",
                              style: theme.textTheme.labelMedium
                                  ?.copyWith(fontSize: 16, color: mediumGray2),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: blueTabBarContainerColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          "NGN $totalAmount",
                          style: theme.textTheme.labelLarge?.copyWith(
                            fontSize: 18,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Button(
                  //     title: "Go to Cart",
                  //     onPressed: () {
                  //       Navigator.of(context).push(
                  //         MaterialPageRoute(
                  //           builder: (context) => CheckOutScreen(
                  //             newCart: newCart,
                  //             totalAmount: totalAmount,
                  //             controller: GlobalCommentController
                  //                 .globalCommentController,
                  //           ),
                  //         ),
                  //       );
                  //     }),
                  Expanded(
                    child: CustomElevatedButton(
                        label: "Go to Cart",
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CheckOutScreen(
                                newCart: newCart,
                                totalAmount: totalAmount,
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ).animate().fadeIn(
                  duration: const Duration(milliseconds: 1000),
                ),
        ],
      ),
    );
  }
}

class Product {
  Product({
    required this.image,
    required this.addedToCart,
    required this.name,
    required this.quantity,
    required this.price,
  });

  bool addedToCart;
  int quantity;
  final String name;
  final String image;
  final double price;

  static List<Product> allProducts = [
    Product(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 100,
    ),
    Product(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 50,
    ),
    Product(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 200,
    ),
    Product(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 12394,
    ),
    Product(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 8904,
    ),
    Product(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 200,
    ),
  ];
}
