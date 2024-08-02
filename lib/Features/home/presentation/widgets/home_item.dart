import 'package:advanced_quran_app/Core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeItem extends StatelessWidget {
  const HomeItem(
      {super.key, required this.text, this.onpressed, required this.icon});
  final String text;
  final VoidCallback? onpressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 16),
        
        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 255, 255, 0.11),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 15),
            Text(
              textAlign: TextAlign.center,
              text,
              style: Styles.textStyle18,
            ),
          ],
        ),
      ),
    );
  }
}
