import 'package:business_project/common/widgets/appbar/appbar.dart';
import 'package:business_project/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:business_project/common/widgets/success_screen/success_screen.dart';
import 'package:business_project/common/widgets/texts/section_heading.dart';
import 'package:business_project/features/shop/screens/cart/cart.dart';
import 'package:business_project/navigation_menu.dart';
import 'package:business_project/utils/constants/colors.dart';
import 'package:business_project/utils/constants/image_strings.dart';
import 'package:business_project/utils/constants/sizes.dart';
import 'package:business_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              CartItemList(
                showAddRemoveButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              CouponCode(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              RoundedContainer(
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    BillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),

                    Divider(),

                    SizedBox(height: TSizes.spaceBtwItems,),

                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => SuccessScreen(image: TImages.successfulPaymentIcon, title: 'Payment Success', subTitle: 'Your item will be shipped soon!', onPressed: () => Get.offAll(() => NavigationMenu()))), child: Text('Checkout \$256.0'),),
      ),
    );
  }
}

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(title: 'Shipping Address', buttonTitle: 'Change', onPressed: () {},),
        Text('sakshi', style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Icon(Icons.phone, color: TColors.grey, size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text('+91 9460696567', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Icon(Icons.location_history, color: TColors.grey, size: 16,),
            SizedBox(width: TSizes.spaceBtwItems,),
            Expanded(child: Text('GN kota', style: Theme.of(context).textTheme.bodyMedium, softWrap: true,)),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
      ],
    );
  }
}


class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        SectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () {},),
        SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          children: [
            RoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? TColors.light : TColors.white,
              padding: EdgeInsets.all(TSizes.sm),
              child: Image(image: AssetImage(TImages.paypal), fit: BoxFit.contain,),
            ),
            SizedBox(width: TSizes.spaceBtwItems / 2,),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,),
          ],
        )
      ],
    );
  }
}


class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$256.0', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6.0', style: Theme.of(context).textTheme.labelLarge,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium,),
            Text('\$6.0', style: Theme.of(context).textTheme.titleMedium,),
          ],
        ),
      ],
    );
  }
}


class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return RoundedContainer(
      showBorder: true,
      backgroundColor: dark ? TColors.dark : TColors.white,
      padding: EdgeInsets.only(
          top: TSizes.sm, right: TSizes.sm, left: TSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
                decoration: InputDecoration(
              hintText: 'Have a promo code? Enter here',
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            )),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark
                        ? TColors.white.withOpacity(0.5)
                        : TColors.dark.withOpacity(0.5),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Text('Apply')),
          )
        ],
      ),
    );
  }
}
