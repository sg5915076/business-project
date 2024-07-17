import 'package:business_project/common/widgets/layouts/grid_layout.dart';
import 'package:business_project/common/widgets/products/product_card_vertical.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../store.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            const BrandShowCase(images: [TImages.productImage3, TImages.productImage2, TImages.productImage1],),
            const SizedBox(height: TSizes.spaceBtwItems,),

            SectionHeading(title: "You might like", onPressed: () {}),
            const SizedBox(height: TSizes.spaceBtwItems,),

            GridLayout(itemCount: 4, itemBuilder: (_, index) => const ProductCardVertical()),
            const SizedBox(height: TSizes.spaceBtwSections,),
          ],

        ),
      ),]
    );
  }
}
