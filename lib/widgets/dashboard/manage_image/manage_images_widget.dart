import 'package:flutter/material.dart';
import 'package:tlcn_project/widgets/dashboard/grid/grid_items_widget.dart';

class ManageImagesWidget extends StatefulWidget {
  final String title;
  final Size itemSize;
  final double padding;

  const ManageImagesWidget({
    Key? key,
    required this.itemSize,
    required this.padding,
    required this.title,
  }) : super(key: key);

  @override
  State<ManageImagesWidget> createState() => _ManageImagesWidgetState();
}

class _ManageImagesWidgetState extends State<ManageImagesWidget> {
  final List<String> images = [
    'assets/images/branch.png',
    'assets/images/branch.png',
    'assets/images/branch.png',
  ];

  @override
  Widget build(BuildContext context) {
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
          widget.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                side: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          child: const Text(
            'Edit',
            style: TextStyle(
              fontSize: 16,
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
          .map((image) => getItem(image))
          .toList();

      list.add(getItemSub(images.last));
    }

    return list;
  }

  Widget getItem(String image) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(
        height: widget.itemSize.height,
        width: widget.itemSize.width,
        fit: BoxFit.cover,
        image,
      ),
    );
  }

  Widget getItemSub(String image) {
    return Stack(
      children: [
        getItem(image),
        Positioned(
          right: 8,
          top: 8,
          child: IconButton(
            splashRadius: 4,
            onPressed: () {
              setState(() {
                images.removeLast();
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
        setState(() {});
      },
      child: getItem('assets/images/image_add.png'),
    );
  }
}
