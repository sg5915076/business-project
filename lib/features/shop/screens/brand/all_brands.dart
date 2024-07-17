import 'package:business_project/common/widgets/appbar/appbar.dart';
import 'package:business_project/common/widgets/layouts/grid_layout.dart';
import 'package:business_project/common/widgets/texts/section_heading.dart';
import 'package:business_project/features/shop/screens/store/store.dart';
import 'package:business_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../all_products/all_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              GridLayout(
                  itemCount: 10,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) => BrandCard(
                        showBorder: true,
                        onTap: () => Get.to(() => BrandProducts()),
                      )),
            ],
          ),
        ),
      ),
    );
  }
}

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              BrandCard(showBorder: true),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
