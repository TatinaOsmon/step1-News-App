import 'package:flutter/material.dart';
import 'package:step1/theme/appColors.dart';

class NewDetailDivider extends StatelessWidget {
  const NewDetailDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.grey,
      height: 20,
      thickness: 2,
    );
  }
}
