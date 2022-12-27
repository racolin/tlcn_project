import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/dashboard_type.dart';
import 'package:tlcn_project/providers/dashboard_provider/products_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/store_provider.dart';
import 'package:tlcn_project/providers/dashboard_provider/stores_provider.dart';
import 'package:tlcn_project/services/safety/base_stateful.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_items_widget.dart';

class ManageImagesWidget extends StatefulWidget {
  final DashboardType type;
  final Size itemSize;
  final double padding;
  // final List<String> images;

  const ManageImagesWidget({
    Key? key,
    required this.type,
    required this.itemSize,
    required this.padding,
    // required this.images,
  }) : super(key: key);

  @override
  State<ManageImagesWidget> createState() => _ManageImagesWidgetState();
}

class _ManageImagesWidgetState extends BaseStateful<ManageImagesWidget> {
  String title = '';
  List<String> images = [];
  final List<Uint8List> imageFiles = [];
  ChangeNotifier? _provider;

  @override
  void initState() {
    if (widget.type == DashboardType.store) {
      title = 'Store Images';
    } else if (widget.type == DashboardType.product) {
      title = 'Product Images';
    }
    super.initState();
  }

  @override
  void initDependencies(BuildContext context) {
    if (widget.type == DashboardType.store) {
      _provider = Provider.of<StoresProvider>(context, listen: false);
    } else if (widget.type == DashboardType.product) {
      _provider = Provider.of<ProductsProvider>(context, listen: false);
    }
    super.initDependencies(context);
  }

  @override
  void afterFirstBuild(BuildContext context) {
    if (widget.type == DashboardType.store) {
      setState(() {
        images = (_provider as StoresProvider).storeSelected.images;
      });
    } else if (widget.type == DashboardType.product) {
      // images = (_provider as ProductsProvider).productSelected.;
    }
    super.afterFirstBuild(context);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var list = getList();
    list.add(getItemAdd());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getTop(),
        const Divider(),
        GridItemsWidget(
          padding: widget.padding,
          list: list,
        ),
      ],
    );
  }

  Widget getTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        TextButton(
          onPressed: () {
            if (widget.type == DashboardType.store) {
              (_provider as StoresProvider).saveImages(context);
            } else if (widget.type == DashboardType.product) {
              // images = (_provider as ProductsProvider).productSelected.;
            }
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: const Text(
            'Save',
            style: TextStyle(
              fontSize: 16,
              color: Colors.green
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> getList() {
    var list = <Widget>[];
    if (images.isNotEmpty) {
      list = images
          .sublist(0, images.length - 1)
          .map((image) => getItem(url: image))
          .toList();
    }
    if (imageFiles.isNotEmpty) {
      if (images.isNotEmpty) {
        list.add(getItem(url: images.last));
      }
      list.addAll(imageFiles
          .sublist(0, imageFiles.length - 1)
          .map((e) => getItem(mem: e)));
      list.add(getItemSub(mem: imageFiles.last));
    } else {
      if (images.isNotEmpty) {
        list.add(getItemSub(url: images.last));
      }
    }
    return list;
  }

  Widget getItem({String? url, Uint8List? mem}) {
    assert(url == null || mem == null);
    var image = url == null
        ? Image.memory(
            height: widget.itemSize.height,
            width: widget.itemSize.width,
            fit: BoxFit.cover,
            mem!,
          )
        : Image.network(
            height: widget.itemSize.height,
            width: widget.itemSize.width,
            fit: BoxFit.cover,
            url,
          );
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: image,
    );
  }

  Widget getItemSub({String? url, Uint8List? mem}) {
    return Stack(
      children: [
        getItem(url: url, mem: mem),
        Positioned(
          right: 8,
          top: 8,
          child: IconButton(
            splashRadius: 4,
            onPressed: () {
              setState(() {
                if (url != null) {
                  images.removeLast();
                  if (_provider is StoresProvider) {
                    (_provider as StoresProvider).deletedImages.add(url.split('/').last);
                  } else if (_provider is ProductsProvider) {

                  }
                } else {
                  imageFiles.removeLast();
                  if (_provider is StoresProvider) {
                    (_provider as StoresProvider).newImages.removeLast();
                  } else if (_provider is ProductsProvider) {

                  }
                }
              });
            },
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  Widget getItemAdd() {
    return InkWell(
      onTap: () async {
        if (kIsWeb) {
          final ImagePicker picker = ImagePicker();
          XFile? image = await picker.pickImage(source: ImageSource.gallery);
          if (image != null) {
            var f = await image.readAsBytes();
            setState(() {
              imageFiles.add(f);
              if (_provider is StoresProvider) {
                (_provider as StoresProvider).newImages.add(f);
              }
            });
          }
        }
      },
      child: getItem(url: 'assets/images/image_add.png'),
    );
  }
}
