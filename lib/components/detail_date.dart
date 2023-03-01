import 'package:flutter/material.dart';
import 'package:step1/theme/appColors.dart';

class NewsDetailDate extends StatelessWidget {
  const NewsDetailDate({
    super.key,
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.access_time,
          color: AppColors.grey,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          time,
          style: const TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
