import 'package:flutter/material.dart';
import 'package:tlcn_project/support/convert.dart';
import 'package:tlcn_project/model/branch_model.dart';
import 'package:tlcn_project/model/product_model.dart';

class BranchItemGrid extends StatelessWidget {
  final Branch branch;

  const BranchItemGrid({
    Key? key,
    required this.branch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            getImage(branch.image),
            InkWell(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
              onTap: () {},
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
        width: 280,
      ),
    );
  }
}

class ProductItemGrid extends StatelessWidget {
  final Product product;

  const ProductItemGrid({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
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
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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
                          icon: const Icon(
                            Icons.visibility_off,
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
                          dateToString(product.dateTime, 'hh:MM dd/mm/yyyy'),
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
        width: 280,
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