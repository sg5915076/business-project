import 'package:business_project/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:business_project/features/authentication/screens/signup.dart';
import 'package:business_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/form_divider.dart';
import '../../../common/widgets/social_buttons.dart';
import '../../../navigation_menu.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(
              top: TSizes.appBarHeight,
              left: TSizes.defaultSpace,
              bottom: TSizes.defaultSpace,
              right: TSizes.defaultSpace,
            ),
          child: Column(
            children: [
              TLoginHeader(dark: dark),

              const TLoginForm(),

              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections,),
              const TSocialButtons()
            ],
          ),

        ),
      ),
    );
  }
}



class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right), labelText: TTexts.email
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields,),
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.password_check), labelText: TTexts.password, suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields / 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value){}),
                    const Text(TTexts.rememberMe),
                  ],
                ),

                TextButton(onPressed: () => Get.to(() => const ForgetPassword()), child: const Text(TTexts.forgetPassword)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const NavigationMenu()), child: Text(TTexts.signIn))),

            const SizedBox(height: TSizes.spaceBtwItems,),

            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignUpScreen()), child: Text(TTexts.createAccount))),

          ],
        ),
      ),
    );
  }
}

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: AssetImage(dark ? TImages.lightAppLogo : TImages.darkAppLogo),
          height: 150,
        ),
        Text(TTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
        const SizedBox(height: TSizes.sm,),
        Text(TTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium,),
      ],
    );
  }
}
