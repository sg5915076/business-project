import 'package:business_project/common/widgets/appbar/appbar.dart';
import 'package:business_project/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:business_project/utils/constants/colors.dart';
import 'package:business_project/utils/constants/sizes.dart';
import 'package:business_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'My Orders', style: Theme.of(context).textTheme.headlineSmall,
        ),showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: OrderListItems(),
      ),
    );
  }
}

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(height: TSizes.spaceBtwItems,),
      itemBuilder: (_, index) => RoundedContainer(
        showBorder: true,
        padding: EdgeInsets.all(TSizes.md),
        backgroundColor: dark ? TColors.dark : TColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Iconsax.ship),
                SizedBox(width: TSizes.spaceBtwItems / 2,),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),),
                      Text('7 nov 2024', style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ),
                IconButton(onPressed: () {}, icon: Icon(Iconsax.arrow_right_34, size: TSizes.iconSm,))
              ],
            ),

            SizedBox(height: TSizes.spaceBtwItems,),
            Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(width: TSizes.spaceBtwItems / 2,),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order', style: Theme.of(context).textTheme.labelMedium,),
                              Text('[#1234]', style: Theme.of(context).textTheme.titleMedium,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.calendar),
                        SizedBox(width: TSizes.spaceBtwItems / 2,),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium,),
                              Text('2, dec, 23', style: Theme.of(context).textTheme.titleMedium,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
            )
          ],
        ),
      ),
    );
  }
}

