import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/app_styles.dart';

class HomeCategoryWidget extends StatelessWidget {
   const HomeCategoryWidget({super.key, required this.text, required this.imageUrl,this.isLeft=true, required this.ontap});
final String text ;
final String imageUrl ;
final bool isLeft ;
final Function ()ontap ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Directionality (textDirection: isLeft ? TextDirection.ltr: TextDirection.rtl,
      child: Container(margin: EdgeInsets.symmetric(vertical: 4),
        height: size.height*.25,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(30)
        ),
        child: Row(
          children: [
            Transform.rotate(
                angle: 0,
                child: Image.asset(imageUrl,width: size.width*.5,fit: BoxFit.cover,)),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  text,
                  style: AppStyles.bold24white
                      .copyWith(color: Theme.of(context).primaryColor,fontSize: 28,overflow:TextOverflow.ellipsis ),
                ),
                InkWell(onTap: ontap,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(84),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            AppLocalizations.of(context)!.view_all,
                            style: AppStyles.normal16white.copyWith(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                        CircleAvatar(backgroundColor: Theme.of(context).primaryColor,
                          radius: 30,
                          child: Icon(Icons.arrow_forward_ios,color: Theme.of(context).colorScheme.secondary,)
                          ,)
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
