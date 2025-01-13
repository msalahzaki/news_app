import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category/source_name_item.dart';
import 'package:news_app/utils/app_color.dart';

class SourceTabWidget extends StatefulWidget {
   const SourceTabWidget({super.key, required this.sourcesList});
 final List<Sources> sourcesList ;

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: widget.sourcesList.length,

        child:TabBar(tabs: widget.sourcesList.map((e) {
          return SourceNameItem(source: e,isSelected:selectedIndex == widget.sourcesList.indexOf(e) ,);
        }
        ).toList(),onTap: (index){
          selectedIndex = index ;
          setState(() {
          });
        },
          isScrollable:true ,
          tabAlignment: TabAlignment.start,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          dividerColor: AppColor.transpernt,
    )
    );
  }
}
