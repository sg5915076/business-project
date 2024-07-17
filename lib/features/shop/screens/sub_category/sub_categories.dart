import 'package:business_project/common/widgets/appbar/appbar.dart';
import 'package:business_project/common/widgets/images/rounded_images.dart';
import 'package:business_project/common/widgets/texts/section_heading.dart';
import 'package:business_project/utils/constants/image_strings.dart';
import 'package:business_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/product_card_horizontal.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Sports shirts'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              RoundedImage(imageUrl: TImages.promoBanner4, width: double.infinity, applyImageRadius: true,),
              SizedBox(height: TSizes.spaceBtwSections,),

              Column(
                children: [
                  SectionHeading(title: 'Sports shirts', onPressed: () {},),
                  SizedBox(height: TSizes.spaceBtwItems / 2,),

                  SizedBox(height: 120,child: ListView.separated(separatorBuilder: (context, index) => SizedBox(width: TSizes.spaceBtwItems,),itemCount: 4,scrollDirection: Axis.horizontal, itemBuilder: (context, index) => ProductCardHorizontal())),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
