import 'package:business_project/common/widgets/form_divider.dart';
import 'package:business_project/common/widgets/social_buttons.dart';
import 'package:business_project/features/authentication/screens/verify_email.dart';
import 'package:business_project/utils/constants/colors.dart';
import 'package:business_project/utils/constants/text_strings.dart';
import 'package:business_project/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(TTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium,),
              
              const SizedBox(height: TSizes.spaceBtwSections,),
              
              TSignUpForm(dark: dark),
              const SizedBox(height: TSizes.spaceBtwSections,),

              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),

              const SizedBox(height: TSizes.spaceBtwSections,),

              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class TSignUpForm extends StatelessWidget {
  const TSignUpForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields,),
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields,),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields,),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields,),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwInputFields,),
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.password, prefixIcon: Icon(Iconsax.password_check), suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwSections,),

          Row(
            children: [
              SizedBox(
                height: 24,
                  width: 24,
                  child: Checkbox(value: true, onChanged: (value){})),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                    text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall
                  ),
                  TextSpan(
                      text: '${TTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  )
                  ),
                  TextSpan(
                      text: '${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall
                  ),
                  TextSpan(
                      text: '${TTexts.termsOfUse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                    color: dark ? TColors.white : TColors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: dark ? TColors.white : TColors.primary,
                  )
                  ),
                ]
              ))
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwSections,),

          SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => Get.to(() => const VerifyEmailScreen()), child: Text(TTexts.createAccount),),)
        ],
      ),
    );
  }
}
