import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.text, required this.icon});
  
  final String text;
  final IconData icon ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon,color: AppColor.white,size: 25,),
          const SizedBox(
            width: 10,
          ),
          Text(text,style: AppStyles.bold20white,)
        ],
      ),
    );
  }
}
