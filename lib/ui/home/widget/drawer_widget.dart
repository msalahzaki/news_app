import 'package:flutter/material.dart';
import 'package:news_app/ui/home/widget/drawer_item.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_styles.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? selectedTheme = "Light"; // Default selection

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.25,
          alignment: Alignment.center,
          color: AppColor.white,
          child: Text(
            "News App",
            style: AppStyles.bold24black,
          ),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        const DrawerItem(text: "Go To Home Page", icon: Icons.home_outlined),
        const Divider(
          color: AppColor.white,
          thickness: 1.5,
          indent: 20,
          endIndent: 20,
        ),
        const DrawerItem(text: "Theme", icon: Icons.format_paint_outlined),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: DropdownMenu<String>(
            width: double.infinity,
            textStyle: AppStyles.normal16white,
            menuStyle: MenuStyle(
              surfaceTintColor: WidgetStateProperty.all(AppColor.white),
            ),
            initialSelection: selectedTheme,
            onSelected: (value) {
              setState(() {
                selectedTheme = value!;
              });
            },
            dropdownMenuEntries: [
              DropdownMenuEntry<String>(
                value: "Light",
                label: "Light",
              ),
              DropdownMenuEntry<String>(value: "Dark", label: "Dark"),
            ],
            // Styling the dropdown menu
          ),
        ),
      ],
    );
  }
}
