import 'package:flutter/material.dart';
import 'package:step1/theme/appColors.dart';

class NewsDetailButton extends StatelessWidget {
  const NewsDetailButton({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.appBar),
      child: const Text('READ MORE'),
    );
  }
}
