import 'package:business_project/common/widgets/appbar/appbar.dart';
import 'package:business_project/common/widgets/images/circular_images.dart';
import 'package:business_project/common/widgets/texts/section_heading.dart';
import 'package:business_project/utils/constants/image_strings.dart';
import 'package:business_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/list_tile/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Profile'
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    CircularImage(image: TImages.user, width: 80, height: 80,),
                    TextButton(onPressed: () {}, child: Text('Change Profile Picture')),
                  ],
                ),
              ),

              SizedBox(height: TSizes.spaceBtwItems / 2,),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems,),

              SectionHeading(title: 'Profile Information', showActionButton: false,),
              SizedBox(height: TSizes.spaceBtwItems,),

              ProfileMenu(title: 'Name', value: 'Sakshi Gupta', onPressed: () {},),
              ProfileMenu(title: 'Username', value: 'sakshi_2702', onPressed: () {},),

              SizedBox(height: TSizes.spaceBtwItems,),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems,),

              SectionHeading(title: 'Personal Information', showActionButton: false,),
              SizedBox(height: TSizes.spaceBtwItems,),

              ProfileMenu(title: 'User ID', value: '2702',icon: Iconsax.copy, onPressed: () {},),
              ProfileMenu(title: 'E-mail', value: 'sg5915076@gmail.com', onPressed: () {},),
              ProfileMenu(title: 'Phone number', value: '9460696567', onPressed: () {},),
              ProfileMenu(title: 'Gender', value: 'Female', onPressed: () {},),
              ProfileMenu(title: 'DOB', value: '27-02-2000', onPressed: () {},),
              Divider(),
              SizedBox(height: TSizes.spaceBtwItems,),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text('Close Account', style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),


        ),
      ),
    );
  }
}


