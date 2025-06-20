import 'package:all_project/Viewmodel/widgets/dashboard_leaves_widget.dart';
import 'package:all_project/Viewmodel/widgets/dashboardwidgets.dart';
import 'package:all_project/Viewmodel/widgets/leaveswidget.dart';
import 'package:flutter/material.dart';

class Leaves extends StatefulWidget {
  Leaves({super.key});

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            toolbarHeight: 80,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                customlogoincircleavatar("assets/1.jpg", context),
                SizedBox(width: 10),
                customsearchbar("Search...", context),
                SizedBox(width: 10),
                customnotificationicon(),
                SizedBox(width: 20),
                userNameFutureBuilder(
                  builder: (userName) => customuserlogo(userName),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customelevatedbutton(
                context,
                'Dashboard',
                'Request Leave',
                selectedIndex,
                (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              SizedBox(height: 20),
              IndexedStack(
                index: selectedIndex,
                children: [mergedLeaveDashboard(), leaveFormSection(context)],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
