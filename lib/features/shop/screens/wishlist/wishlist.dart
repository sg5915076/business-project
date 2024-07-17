import 'package:business_project/common/widgets/appbar/appbar.dart';
import 'package:business_project/common/widgets/icons/circular_icon.dart';
import 'package:business_project/common/widgets/layouts/grid_layout.dart';
import 'package:business_project/common/widgets/products/product_card_vertical.dart';
import 'package:business_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

import '../home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Whishlist', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          CircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              GridLayout(itemCount: 4, itemBuilder: (_, index) => ProductCardVertical())
            ]
          ),
        ),
      ),
    );
  }
}
