import 'package:dashbord_ui/Model/my_file.dart';
import 'package:dashbord_ui/Screens/components/file_info_card.dart';
import 'package:dashbord_ui/constant/colors.dart';
import 'package:dashbord_ui/responsive.dart';
import 'package:flutter/material.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: _size.width < 450
              ? FileInfoGridView(
                  crossAxisCount: _size.width < 450 ? 1 : 4,
                  childAspectRatio: _size.width < 450 ? 1.5 : 0.8,
                )
              : FileInfoGridView(
                  crossAxisCount: _size.width < 550 ? 2 : 4,
                  childAspectRatio: _size.width < 550 ? 1.2 : 0.8,
                ),
          tablet: FileInfoGridView(
            childAspectRatio: _size.width < 950 ? 0.9 : 1,
          ),
          desktop: FileInfoGridView(
            childAspectRatio: _size.width < 1400 ? 1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoGridView extends StatelessWidget {
  const FileInfoGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: demoMyFiels.length,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount, //cross axis count
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio, //aspect ratio
      ),
      itemBuilder: (context, i) => FileInfoCard(info: demoMyFiels[i]),
    );
  }
}
