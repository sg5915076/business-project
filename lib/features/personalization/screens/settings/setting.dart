import 'package:business_project/common/widgets/appbar/appbar.dart';
import 'package:business_project/common/widgets/images/circular_images.dart';
import 'package:business_project/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:business_project/common/widgets/texts/section_heading.dart';
import 'package:business_project/features/shop/screens/home/home.dart';
import 'package:business_project/features/shop/screens/order/order.dart';
import 'package:business_project/utils/constants/image_strings.dart';
import 'package:business_project/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../address/address.dart';
import '../profile/profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeaderContainer(child: Column(
              children: [
                CustomAppBar(title: Text("Account", style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),),


                UserProfileTile(onPressed: () => Get.to(() => const ProfileScreen()),),
                SizedBox(height: TSizes.spaceBtwSections,),
              ],
            )),

            Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                SectionHeading(title: "Account Setting", showActionButton: false,),
                SizedBox(height: TSizes.spaceBtwItems,),

                SettingsMenuTile(icon: Iconsax.safe_home, title: 'My Addresses', subtitle: 'Set shopping delivery address', onTap: () => Get.to(() => UserAddressScreen()),) ,
                SettingsMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subtitle: 'Add, remove products and move to checkout', onTap: (){},),
                SettingsMenuTile(icon: Iconsax.bag_tick, title: 'My Orders', subtitle: 'In-progress and Completed Orders', onTap: () => Get.to(() => OrderScreen()),),
                SettingsMenuTile(icon: Iconsax.bank, title: 'Bank Account', subtitle: 'Withdraw balance to registered bank account', onTap: (){},),
                SettingsMenuTile(icon: Iconsax.discount_shape, title: 'My Coupons', subtitle: 'List of all the discounted coupons', onTap: (){},),
                SettingsMenuTile(icon: Iconsax.notification, title: 'Notifications', subtitle: 'Set any kind of notification message', onTap: (){},),
                SettingsMenuTile(icon: Iconsax.security_card, title: 'Account Privacy', subtitle: 'Manage data usage and connected accounts', onTap: (){},),

                SizedBox(height: TSizes.spaceBtwSections,),
                SectionHeading(title: 'App Settings', showActionButton: false,),
                SizedBox(height: TSizes.spaceBtwItems,),
                SettingsMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subtitle: 'Upload Data to your Cloud Firebase'),
                SettingsMenuTile(icon: Iconsax.location, title: 'Geolocation', subtitle: 'Set recommendation based on location', trailing: Switch(value: true, onChanged: (value){},),),
                SettingsMenuTile(icon: Iconsax.security_user, title: 'Safe Mode', subtitle: 'Search result is safe for all ages', trailing: Switch(value: false, onChanged: (value){},),),
                SettingsMenuTile(icon: Iconsax.image, title: 'HD Image Quality', subtitle: 'Set image quality to be seen', trailing: Switch(value: false, onChanged: (value){},),),

                SizedBox(height: TSizes.spaceBtwSections,),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(onPressed: (){} , child: const Text('Logout'),),
                ),
                SizedBox(height: TSizes.spaceBtwSections * 2.5,),
              ],
            ),
            )
          ],
        )
      ),
    );
  }
}

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircularImage(image: TImages.user,
      width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text("Sakshi Gupta", style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white),),
      subtitle: Text("sg5915076@gmail.com", style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed: onPressed, icon: Icon(Iconsax.edit, color: TColors.white,),),
    );
  }
}
