import 'package:dashbord_ui/Screens/dashboard/dashbord_screen.dart';
import 'package:dashbord_ui/controllers/controller.dart';
import 'package:dashbord_ui/responsive.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/components/side_menu.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
      // context.read<MenuController>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                child: SideMenu(),
              ),
            Expanded(
              flex: 5,
              child: DashbordScreen(globalKey: _scaffoldKey),
            ),
          ],
        ),
      ),
    );
  }
}
