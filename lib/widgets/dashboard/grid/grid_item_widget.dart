import 'package:flutter/material.dart';
import 'package:tlcn_project/supports/convert.dart';
import 'package:tlcn_project/models/branch_model.dart';
import 'package:tlcn_project/models/product_model.dart';

class BranchItemGrid extends StatelessWidget {
  final Branch branch;
  final Function(String) onSelect;

  const BranchItemGrid({
    Key? key,
    required this.branch,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 235,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            getImage(branch.image),
            InkWell(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              onTap: () {
                onSelect(branch.id);
              },
              onHover: (status) {},
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      branch.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      branch.description,
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Open at ${dateToString(branch.opened, 'dd/MM/yyyy')}',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImage(String image) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Image.network(
        fit: BoxFit.cover,
        image,
        height: 150,
        width: 235,
      ),
    );
  }
}

class ProductItemGrid extends StatelessWidget {
  final ProductModel product;

  const ProductItemGrid({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 235,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            getImage(product.image),
            InkWell(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              onHover: (status) {},
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(16),
                  ),
                  color: product.hide ? Colors.white : Colors.tealAccent.withAlpha(50),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      product.name,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          numberToCurrency(product.price, 'VND'),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {},
                          splashRadius: 20,
                          icon: const Icon(
                            Icons.edit,
                            size: 16,
                          ),
                          color: Colors.grey,
                        ),
                        IconButton(
                          onPressed: () {},
                          splashRadius: 20,
                          icon: Icon(
                            product.hide
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 16,
                          ),
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getPerWeek(product.perWeek),
                        const Spacer(),
                        const Icon(
                          Icons.edit_note,
                          color: Colors.grey,
                          size: 20,
                        ),
                        Text(
                          dateToString(product.dateTime, 'hh:mm dd/MM/yyyy'),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getImage(String image) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Image.network(
        fit: BoxFit.cover,
        image,
        height: 150,
        width: 235,
      ),
    );
  }

  Widget getPerWeek(int perWeek) {
    Color colorStatus = perWeek < 0 ? Colors.red : Colors.green;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.arrow_circle_up_rounded,
              color: colorStatus,
              size: 16,
            ),
            Text(
              perWeek.toString(),
              style: TextStyle(
                color: colorStatus,
                fontSize: 14,
              ),
            ),
            Icon(
              Icons.emoji_food_beverage,
              color: colorStatus,
              size: 16,
            )
          ],
        ),
        const Text(
          'Per Week',
          style: TextStyle(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
