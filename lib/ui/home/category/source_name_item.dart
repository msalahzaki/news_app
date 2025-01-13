import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/utils/app_styles.dart';

class SourceNameItem extends StatelessWidget {
  const SourceNameItem(
      {super.key, required this.source, required this.isSelected});
  final Sources source;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Text(source.name ?? "",
        style: isSelected
            ? AppStyles.bold14black
                .copyWith(color: Theme.of(context).colorScheme.secondary)
            : AppStyles.normal14white.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ));
  }
}
