import 'package:business_project/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:business_project/common/widgets/images/rounded_images.dart';
import 'package:business_project/utils/constants/colors.dart';
import 'package:business_project/utils/constants/image_strings.dart';
import 'package:business_project/utils/constants/sizes.dart';
import 'package:business_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../styles/shadow_styles.dart';
import '../icons/circular_icon.dart';
import '../texts/product_title_text.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
          padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey : TColors.white,
        ),
        child: Column(
          children: [
            RoundedContainer(
              height: 180,
              width: 180,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  TRoundedImage(imageUrl: TImages.productImage1, applyImageRadius: true,),

                  Positioned(
                    top: 10,
                    child: RoundedContainer(radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),

                  Positioned(top: 0, right: 0, child: CircularIcon(width: 40, height: 40, icon: Iconsax.heart5, color: Colors.red,))
                ],
              ),
            ),

            SizedBox(height: TSizes.spaceBtwItems / 2,),

            Padding(padding: EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: 'Green Nike Air Shoes',),
                  SizedBox(height: TSizes.spaceBtwItems / 2,),
                  Row(
                    children: [
                      Text('Nike', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium,),
                      SizedBox(height: TSizes.sm,),
                      Icon(Iconsax.verify5, color: TColors.primary, size: TSizes.iconXs,),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$35.5',
                      maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          )
                        ),
                        child: SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Center(child: Icon(Iconsax.add, color: TColors.white))),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


