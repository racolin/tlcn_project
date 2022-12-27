import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/models/store_model.dart';
import 'package:tlcn_project/providers/dashboard_provider/stores_provider.dart';
import 'package:tlcn_project/services/safety/base_stateful.dart';
import 'package:tlcn_project/supports/convert.dart';
import 'package:tlcn_project/widgets/dashboard/store/services_widget.dart';

class StoreDetailWidget extends StatefulWidget {
  const StoreDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StoreDetailWidget> createState() => _StoreDetailWidgetState();
}

class _StoreDetailWidgetState extends BaseStateful<StoreDetailWidget> {
  late StoresProvider _storesProvider;

  @override
  void initDependencies(BuildContext context) {
    _storesProvider = context.read<StoresProvider>();
    super.initDependencies(context);
  }

  @override
  void afterFirstBuild(BuildContext context) {
    // TODO: implement afterFirstBuild
    super.afterFirstBuild(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Consumer<StoresProvider>(
      builder: (context, instance, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Store Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Provider.of<StoresProvider>(context, listen: false)
                      .onCancel();
                },
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
              // const SizedBox(
              //   width: 8,
              // ),
              // TextButton(
              //   onPressed: () {},
              //   style: ButtonStyle(
              //     shape: MaterialStateProperty.all(
              //       RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(8),
              //         side: const BorderSide(color: Colors.grey),
              //       ),
              //     ),
              //   ),
              //   child: const Text(
              //     'Edit',
              //     style: TextStyle(
              //       fontSize: 16,
              //       color: Colors.orange,
              //       fontWeight: FontWeight.w700,
              //     ),
              //   ),
              // ),
            ],
          ),
          const Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
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
                          'Store name',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          initialValue: instance.storeSelected.storeName,
                          decoration: InputDecoration(
                            labelText: 'Enter store name',
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
                              child: TextFormField(
                                initialValue: timeToString(
                                    instance.storeSelected.openTime),
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
                              child: TextFormField(
                                initialValue: timeToString(
                                    instance.storeSelected.closeTime),
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
              const SizedBox(
                height: 8,
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
                        TextFormField(
                          initialValue: instance.storeSelected.address,
                          decoration: InputDecoration(
                            labelText: 'Enter store\'s address.',
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
              const SizedBox(
                height: 8,
              ),
              const Text(
                'Services',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              for (var index = 0;
                  index < instance.storeSelected.storeServices.length;
                  index++)
                ServiceWidget(
                  service: instance.storeSelected.storeServices[index],
                  delete: () {
                    setState(() {
                      instance.storeSelected.storeServices.removeAt(index);
                    });
                  },
                  edit: (service) {
                    setState(() {
                      instance.storeSelected.storeServices[index] = service;
                    });
                  },
                ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  setState(() {
                    instance.storeSelected.storeServices.add(
                      ServiceModel(
                        icon: Icons.add,
                        serviceName: 'Service name',
                      ),
                    );
                  });
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Menu',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Divider(),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: getListMenu(
                    'Available',
                    instance.storeSelected.itemMenus
                        .where((element) => element.available)
                        .toList(),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: getListMenu(
                    'Unavailable',
                    instance.storeSelected.itemMenus
                        .where((element) => !element.available)
                        .toList(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget getListMenu(String title, List<ItemMenu> items) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        ...items
            .map(
              (item) => Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(item.storeProduct.image),
                  ),
                  title: Text(item.storeProduct.name),
                  trailing: IconButton(
                    onPressed: () {
                      _storesProvider.swap(item.storeProduct.id);
                    },
                    icon: const Icon(Icons.swap_horiz),
                  ),
                ),
              ),
            )
            .toList(),
      ],
    );
  }

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
