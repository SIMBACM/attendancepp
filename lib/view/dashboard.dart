import 'package:all_project/Viewmodel/widgets/dashboardwidgets.dart';
import 'package:all_project/view/Leaves.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  final String checkinMessage;
  final String checkoutMessage;
  Dashboard({
    Key? key,
    required this.checkinMessage,
    required this.checkoutMessage,
  }) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;
  int? _selectedindex = null;
  String _selectedButton = "Deadline";
  String selectedbutton = "start";

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Map<String, dynamic>> metrics = [
    {
      "icon": Icons.calendar_today,
      "label": "Total Working\nDays",
      "value": "27",
    },
    {
      "icon": Icons.access_time,
      "label": "Total Hours\nworked",
      "value": "160 hours",
    },
    {
      "icon": Icons.av_timer,
      "label": "Average Daily\nHours",
      "value": "8.0 hours",
    },
    {
      "icon": Icons.bar_chart,
      "label": "Productivity Indicator",
      "value": "80%",
    },
    {
      "icon": Icons.people,
      "label": "Projects Involved",
      "value": "Revenue\nDashboard",
    },
    {"icon": Icons.event_note, "label": "Leave\nTaken", "value": "2 days"},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            flexibleSpace: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  userNameFutureBuilder(
                    builder:
                        (userName) => boxwithnameandrole(
                          userName,
                          "Full Stack Developer",
                        ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              userNameonlyFutureBuilder(),
              SizedBox(height: 15),
              checkinandoutwidget(
                widget.checkinMessage,
                widget.checkoutMessage,
                "09:20 am_11-06-2025",
                "Location/IP (for remote attendance)",
                context,
                "Punch in",
                "Punch out",
              ),
              SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Overview",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              leaveDetails("Presence", "20", "Absence", "02", "Leaves", "03"),
              SizedBox(height: 5),
              customscrollingbuttons(
                titles: [
                  'My tasks',
                  'Task tracker',
                  'Ongoing & pending',
                  'Work summary',
                ],
                selectedIndex: _selectedindex,
                onButtonTap: (index) {
                  setState(() {
                    _selectedindex = index;
                  });
                },
              ),
              customRadioButtons(
                title: "Sort By",
                title1: "Deadline",
                title2: "Project",
                selectedButton: _selectedButton,
                onChanged: (value) {
                  setState(() {
                    _selectedButton = value!;
                  });
                },
              ),
              if (_selectedindex == 0)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: custommytasks(
                        "UI/UX Design Implementation",
                        "• Translating design specifications into functional and visually appealing user interfaces using technologies like HTML, CSS, and JavaScript",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: custommytasks(
                        "Responsive Design",
                        "• Ensuring that the application adapts seamlessly to different screen sizes and devices.",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: custommytasks(
                        "Back-end Development",
                        "• Creating and managing databases for efficient data storage, retrieval,and processing",
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: custommytasks(
                        "Server-Side Login",
                        "• Developing and maintaining the logic that runs on the server, handling user requests, processing data, and interacting with databases.",
                      ),
                    ),
                  ],
                ),
              if (_selectedindex == 1)
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: trackerItem(
                        title: "Responsive Design",
                        dueDate: "18-06-2025",
                        progress: 25,
                        remaining: "2 days left",
                        priority: "High",
                        status: "In progress",
                        onSelectionChanged: (val) {
                          setState(() {
                            selectedbutton = val!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: trackerItem(
                        title: "UI/UX Design Implementation",
                        dueDate: "18-06-2025",
                        progress: 69,
                        remaining: "2 days left",
                        priority: "High",
                        status: "Completed",
                        onSelectionChanged: (val) {
                          setState(() {
                            selectedbutton = val!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: trackerItem(
                        title: "Back-end Development",
                        dueDate: "18-06-2025",
                        progress: 75,
                        remaining: "2 days left",
                        priority: "Low",
                        status: "In progress",
                        onSelectionChanged: (val) {
                          setState(() {
                            selectedbutton = val!;
                          });
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: trackerItem(
                        title: "Server-Side Login",
                        dueDate: "18-06-2025",
                        progress: 25,
                        remaining: "2 days left",
                        priority: "Medium",
                        status: "Overdue",
                        onSelectionChanged: (val) {
                          setState(() {
                            selectedbutton = val!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              if (_selectedindex == 2)
                Column(
                  children: [
                    ongoingItemSimple(
                      startDate: "12-06-2025",
                      title: "UI/UX Design Implementation",
                      status: "in progress",
                      completion: "70% Done",
                      completionDate: "12-05-2025",
                      priority: "High",
                    ),
                    ongoingItemSimple(
                      startDate: "12-06-2025",
                      title: "Responsive Design",
                      status: "in progress",
                      completion: "70% Done",
                      completionDate: "12-05-2025",
                      priority: "High",
                    ),
                    ongoingItemSimple(
                      startDate: "12-06-2025",
                      title: "Back-end Development",
                      status: "in progress",
                      completion: "70% Done",
                      completionDate: "12-05-2025",
                      priority: "High",
                    ),
                    ongoingItemSimple(
                      startDate: "12-06-2025",
                      title: "Server-Side Login",
                      status: "Pending",
                      completion: "70% Done",
                      completionDate: "12-05-2025",
                      priority: "Low",
                    ),
                  ],
                ),
              if (_selectedindex == 3)
                Padding(
                  padding: EdgeInsets.all(12),
                  child: metricGrid(metrics),
                ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Dashboard",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              dashboard(
                "Attendance",
                'assets/10.jpg',
                () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>DashInsideLeaves()));
                },
                "Leaves",
                "assets/11.jpg",
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Leaves()),
                  );
                },
                "Leave Status",
                "assets/12.jpeg",
                () {},
              ),
              SizedBox(height: 10),
              dashboard(
                "Holiday List",
                'assets/5.png',
                () {},
                "Payslips",
                'assets/7.jpeg',
                () {},
                "Reports",
                'assets/images.png',
                () {},
              ),
              // Make sure this is at the bottom of the Scaffold, not inside the scroll
            ],
          ),
        ),
        bottomNavigationBar: custombottomnavigation(
          "Home",
          "History",
          "Leaves",
          "Profile",
          selectedIndex,
          _onItemTapped,
        ),
      ),
    );
  }
}
