import 'package:dashbord_ui/Screens/components/header.dart';
import 'package:dashbord_ui/Screens/components/my_files.dart';
import 'package:dashbord_ui/Screens/components/recent_files.dart';
import 'package:dashbord_ui/Screens/components/storage_details.dart';
import 'package:dashbord_ui/constant/colors.dart';
import 'package:dashbord_ui/responsive.dart';
import 'package:flutter/material.dart';

class DashbordScreen extends StatelessWidget {
  DashbordScreen({
    Key? key,
    required this.globalKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            //& header
            Header(keys: globalKey),

            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      //^ files
                      const MyFiles(),

                      const SizedBox(height: defaultPadding),

                      //* recent files
                      const RecentFIles(),

                      //~ storage details in column (responsive for mobile)
                      if (Responsive.isMobile(context))
                        const SizedBox(height: defaultPadding),
                      if (Responsive.isMobile(context)) const StorageDetails(),
                    ],
                  ),
                ),

                if (!Responsive.isMobile(context))
                  const SizedBox(width: defaultPadding),

                //! storage details

                if (!Responsive.isMobile(context))
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
