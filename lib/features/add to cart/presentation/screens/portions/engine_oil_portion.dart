import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gaspay_mobile/core/presentation/widgets/button.dart';
import '../../../../../core/presentation/manager/global_comment_controller.dart';
import '../../../../../core/presentation/theme/colors/colors.dart';
import '../../../../../core/presentation/widgets/custom_comment_text_field_container.dart';
import '../../../../checkout/presentation/screens/check_out_screen.dart';
import '../../widgets/reusable_engine_oil_container.dart';


class EngineOilPortion extends StatefulWidget {
  const EngineOilPortion({super.key, required this.context});

  final BuildContext context;

  @override
  State<EngineOilPortion> createState() => _EngineOilPortionState();
}

class _EngineOilPortionState extends State<EngineOilPortion> {
  List<EngineProduct> newCart = [];
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
    GlobalCommentController.globalCommentController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool visibleContainer =MediaQuery.of(widget.context).viewInsets.bottom != 0;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: EngineProduct.allEngineProducts.length,
                itemBuilder: (context, index) {
                  return ReusableEngineOilContainer(
                    product: EngineProduct.allEngineProducts[index],
                    addToCart: () {
                      setState(() {
                        EngineProduct.allEngineProducts[index].addedToCart =
                            true;
                        EngineProduct.allEngineProducts[index].quantity = 1;
                        newCart.add(EngineProduct.allEngineProducts[index]);
                        updatePrice();
                      });
                    },
                    addQuantity: () {
                      setState(() {
                        EngineProduct.allEngineProducts[index].quantity++;
                        updatePrice();
                      });
                    },
                    removeQuantity: () {
                      setState(() {
                        if (EngineProduct.allEngineProducts[index].quantity >
                            1) {
                          EngineProduct.allEngineProducts[index].quantity--;
                          updatePrice();
                        } else {
                          EngineProduct.allEngineProducts[index].addedToCart =
                              false;
                          newCart
                              .remove(EngineProduct.allEngineProducts[index]);
                          updatePrice();
                        }
                      });
                    },
                  );
                }),
          ),
          if (newCart.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Comments",
                    style: theme.textTheme.labelLarge?.copyWith(
                      fontSize: 16,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  CustomCommentTextFieldContainer(
                    controller: GlobalCommentController.globalCommentController,
                  ),
                ],
              ).animate().fadeIn(
                duration: const Duration(milliseconds: 1000),
              ),
            ),
          // const SizedBox(
          //   height: 20,
          // ),
          if (newCart.isNotEmpty)
            Visibility(
              visible: !visibleContainer,
              child: Container(
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
                                  controller: GlobalCommentController
                                      .globalCommentController,
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
            ),
        ],
      ),
    );
  }
}

class EngineProduct {
  EngineProduct({
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

  static List<EngineProduct> allEngineProducts = [
    EngineProduct(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 100,
    ),
    EngineProduct(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 50,
    ),
    EngineProduct(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 200,
    ),
    EngineProduct(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 12394,
    ),
    EngineProduct(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 8904,
    ),
    EngineProduct(
      image: "assets/images/buyGas2.png",
      addedToCart: false,
      name: "Diesel",
      quantity: 0,
      price: 200,
    ),
  ];
}
