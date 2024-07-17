import 'package:business_project/common/widgets/appbar/appbar.dart';
import 'package:business_project/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:business_project/utils/constants/colors.dart';
import 'package:business_project/utils/constants/image_strings.dart';
import 'package:business_project/utils/constants/sizes.dart';
import 'package:business_project/utils/device/device_utility.dart';
import 'package:business_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: Text('Reviews & Ratings'), showBackArrow: true,),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ratings and reviews are verified and are from people who use the same type of device that you use.'),
              SizedBox(height: TSizes.spaceBtwItems,),
              OverallProductRating(),

              CustomRatingBarIndicator(rating: 3.5,),
              Text('12,611', style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(height: TSizes.spaceBtwSections,),

              UserReviewCard(),
              UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                SizedBox(width: TSizes.spaceBtwItems,),
                Text('John Doe', style: Theme.of(context).textTheme.titleLarge,),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        SizedBox(width: TSizes.spaceBtwItems,),

        Row(
          children: [
            CustomRatingBarIndicator(rating: 4),
            SizedBox(width: TSizes.spaceBtwItems,),
            Text('01 Nov, 2024', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems,),
        ReadMoreText('The user interface of the app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job!',
        trimLines: 1,
          trimExpandedText: ' show less',
          trimCollapsedText: ' show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
          lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        SizedBox(height: TSizes.spaceBtwItems,),

        RoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sakshi store', style: Theme.of(context).textTheme.titleMedium,),
                    Text('2 Nov, 2024', style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwItems,),
                ReadMoreText('The user interface of the app is quite intuitive. I was able to navigate and make purchase seamlessly. Great job!',
                  trimLines: 1,
                  trimExpandedText: ' show less',
                  trimCollapsedText: ' show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: TSizes.spaceBtwSections,),
      ],
    );
  }
}


class CustomRatingBarIndicator extends StatelessWidget {
  const CustomRatingBarIndicator({
    super.key, required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(rating: rating, itemSize: 20, unratedColor: TColors.grey, itemBuilder: (_, __) => Icon(Iconsax.star1, color: TColors.primary,));
  }
}

class OverallProductRating extends StatelessWidget {
  const OverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3,child: Text('4.8', style: Theme.of(context).textTheme.displayLarge,)),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicator(text: '5', value: 1.0,),
              RatingProgressIndicator(text: '4', value: 0.8,),
              RatingProgressIndicator(text: '3', value: 0.6,),
              RatingProgressIndicator(text: '2', value: 0.4,),
              RatingProgressIndicator(text: '1', value: 0.2,),
            ],
          ),
        )
      ],
    );
  }
}

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key, required this.text, required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1,child: Text(text, style: Theme.of(context).textTheme.bodyMedium,)),

        Expanded(
          flex: 11,
          child: SizedBox(
            width: TDeviceUtils.getScreenWidth(context) * 0.5,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: TColors.grey,
              valueColor: AlwaysStoppedAnimation(TColors.primary),
              borderRadius: BorderRadius.circular(7),

            ),
          ),
        )
      ],
    );
  }
}
