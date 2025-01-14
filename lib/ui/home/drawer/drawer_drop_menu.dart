import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_styles.dart';

class DrawerDropMenu extends StatefulWidget {
  DrawerDropMenu(
      {super.key,
      required this.option1,
      required this.option2,
      required this.selected,
      required this.onSelected});

  final String option1;

  final String option2;

  String selected;

  final Function(String) onSelected;

  @override
  State<DrawerDropMenu> createState() => _DrawerDropMenuState();
}

class _DrawerDropMenuState extends State<DrawerDropMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      trailingIcon: const Icon(
        Icons.keyboard_arrow_down,
        color: AppColor.white,
        size: 30,
      ),
      selectedTrailingIcon: const Icon(
        Icons.keyboard_arrow_up,
        color: AppColor.white,
        size: 30,
      ),
      width: double.infinity,
      textStyle: AppStyles.normal16white,
      initialSelection: widget.selected,
      onSelected: (value) {
        widget.onSelected(value!);
        setState(() {
          widget.selected = value;
        });
      },
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: widget.option1,
          label: widget.option1,
        ),
        DropdownMenuEntry(value: widget.option2, label: widget.option2),
      ],
      // Styling the dropdown menu
    );
  }
}
