import 'package:flutter/material.dart';

class PagingWidget extends StatefulWidget {
  const PagingWidget({Key? key}) : super(key: key);

  @override
  State<PagingWidget> createState() => _PagingWidgetState();
}

class _PagingWidgetState extends State<PagingWidget> {
  int indexSelected = 1;
  int pages = 10;
  bool hasPrevious = false;
  bool hasNext = true;

  void selectPage(int page) {
    if (indexSelected != page && page > 0 && page <= pages) {
      setState(() {
        indexSelected = page;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 32),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkResponse(
            onTap: () {
              selectPage(indexSelected - 1);
            },
            onHover: (status) {},
            child: getPageNumber(
              const Icon(
                Icons.keyboard_double_arrow_left,
                color: Colors.white,
              ),
              indexSelected == 0,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 768,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (int i = 1; i <= pages; i++)
                    InkResponse(
                      onTap: () {
                        selectPage(i);
                      },
                      onHover: (status) {},
                      child: getPageNumber(
                        Text(
                          i.toString(),
                          style: TextStyle(
                              color: i == indexSelected
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                        i == indexSelected,
                      ),
                    ),
                ],
              ),
            ),
          ),
          InkResponse(
            onTap: () {
              selectPage(indexSelected + 1);
            },
            onHover: (status) {},
            child: getPageNumber(
              const Icon(
                Icons.keyboard_double_arrow_right,
                color: Colors.white,
              ),
              indexSelected > pages,
            ),
          ),
        ],
      ),
    );
  }

  Widget getPageNumber(Widget item, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(24),
      ),
      margin: const EdgeInsets.all(8),
      height: 48,
      width: 48,
      child: item,
    );
  }
}
