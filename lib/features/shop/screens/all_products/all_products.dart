import 'package:business_project/common/widgets/appbar/appbar.dart';
import 'package:business_project/common/widgets/layouts/grid_layout.dart';
import 'package:business_project/common/widgets/products/product_card_vertical.dart';
import 'package:business_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: SortableProducts(),
        ),
      ),
    );
  }
}

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            onChanged: (value) {},
            items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((option) => DropdownMenuItem(
                value: option,
                child: Text(option))).toList(),),
        SizedBox(height: TSizes.spaceBtwSections,),
        GridLayout(itemCount: 12, itemBuilder: (_, index) => ProductCardVertical()),
      ],
    );
  }
}
