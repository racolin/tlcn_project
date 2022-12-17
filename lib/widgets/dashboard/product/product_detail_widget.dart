import 'package:flutter/material.dart';
import 'package:tlcn_project/model/product_model.dart';

class ProductDetailWidget extends StatefulWidget {
  final Product? product;

  const ProductDetailWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Product Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              child: const Text(
                'Save',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              child: const Text(
                'Edit',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.orange,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
        const Divider(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 400,
                  height: 96,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Product name',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter product name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 32),
                SizedBox(
                  width: 240,
                  height: 96,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Open time',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 80,
                            child: TextField(
                              textAlign: TextAlign.center,
                              maxLength: 5,
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                          Container(
                            width: 32,
                            alignment: Alignment.center,
                            child: const Text(
                              '-',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: TextField(
                              textAlign: TextAlign.center,
                              maxLength: 5,
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 624,
                  height: 96,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter product\'s address.',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              'Services',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            // const SizedBox(height: 8),
            // ...widget.product == null
            //     ? []
            //     : widget.product!.productServices
            //         .map((service) => ServiceWidget(
            //             service: service,
            //             delete: () {
            //               setState(() {
            //                 widget.product!.productServices.remove(service);
            //               });
            //             }))
            //         .toList(),
            // const SizedBox(height: 8),
            // TextButton(
            //   onPressed: () {
            //     setState(() {
            //       widget.product!.productServices.add(ProductService(
            //           icon: Icons.add, serviceName: 'Service name'));
            //     });
            //   },
            //   style: ButtonStyle(
            //     shape: MaterialStateProperty.all(
            //       RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(8),
            //         side: const BorderSide(color: Colors.grey),
            //       ),
            //     ),
            //   ),
            //   child: const Text(
            //     'Add',
            //     style: TextStyle(
            //       fontSize: 16,
            //       color: Colors.red,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            // ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Menu',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Divider(),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       child: Container(
        //         alignment: Alignment.topLeft,
        //         child: getListMenu(
        //           'Available',
        //           widget.product!.itemMenus
        //               .where((element) => element.available)
        //               .map((e) => e.productProduct)
        //               .toList(),
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       child: Container(
        //         alignment: Alignment.topLeft,
        //         child: getListMenu(
        //           'Unavailable',
        //           widget.product!.itemMenus
        //               .where((element) => !element.available)
        //               .map((e) => e.productProduct)
        //               .toList(),
        //         ),
        //       ),
        //     ),
        //   ],
        // )
      ],
    );
  }

  // Widget getListMenu(String title, List<ProductProduct> products) {
  //   return Column(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Text(
  //         title,
  //         style: const TextStyle(
  //           fontSize: 18,
  //           fontWeight: FontWeight.w700,
  //         ),
  //       ),
  //       ...products
  //           .map(
  //             (product) => Card(
  //               child: ListTile(
  //                 leading: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: Image.asset(product.image),
  //                 ),
  //                 title: Text(product.name),
  //                 trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.swap_horiz)),
  //               ),
  //             ),
  //           )
  //           .toList(),
  //     ],
  //   );
  // }

  Widget getField(String title, String hint, int length) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        TextField(
          maxLength: length,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ],
    );
  }
}