import 'package:all_project/Viewmodel/services.dart';
import 'package:all_project/Viewmodel/widgets/checkinandoutwidget.dart';
import 'package:flutter/material.dart';

/// Widget: User info box with name and role
Widget boxwithnameandrole(String title, String subtitle) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
    child: Container(
      width: 275,
      height: 75,
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 58, 22, 165), Color(0xFF3D834C)],
        ),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // User avatar and name/role
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    title[0].toUpperCase(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),

          // Positioned profile image and notification icon
          Positioned(
            right: -50,
            top: 2,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/3.jpg"),
            ),
          ),
          Positioned(
            top: 3,
            right: -120,
            child: IconButton(
              style: IconButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined, color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}

/// Widget: FutureBuilder to get username and build custom UI
Widget userNameFutureBuilder({required Widget Function(String name) builder}) {
  return FutureBuilder<String?>(
    future: getUserName(), // Your Firebase call
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text("Error loading name"));
      } else if (!snapshot.hasData || snapshot.data == null) {
        return Center(child: Text("No username found"));
      }

      return builder(snapshot.data!);
    },
  );
}

/// Widget: FutureBuilder to get only the username as Text
Widget userNameonlyFutureBuilder({TextStyle? style}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      children: [
        FutureBuilder<String?>(
          future: getUserName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('"Good morning, [Error]"');
            } else if (!snapshot.hasData || snapshot.data == null) {
              return Text('"Good morning, [No username]"');
            }

            return Text(
              '"Good morning,\n ${snapshot.data!}"',
              style:
                  style ??
                  TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(179, 68, 66, 66),
                  ),
            );
          },
        ),
      ],
    ),
  );
}

/// Widget: Check-in / Check-out container
Widget checkinandoutwidget(
  String checkinMessage,
  String checkoutMessage,
  String subtile1,
  String subtitle2,
  BuildContext context,
  String title2,
  String title1,
) {
  return Material(
    elevation: 2,
    child: Container(
      width: 385,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Check-in status text
          if (checkinMessage.isNotEmpty)
            Text(
              checkinMessage,
              style: TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          if (checkoutMessage.isNotEmpty)
            Text(
              checkoutMessage,
              style: TextStyle(
                fontSize: 14,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

          SizedBox(height: 8),

          // Punch clock row
          Row(
            children: [
              Icon(Icons.punch_clock, color: Colors.amber),
              SizedBox(width: 10),
              Text(
                subtile1,
                style: TextStyle(color: Colors.amber, fontSize: 14),
              ),
            ],
          ),

          SizedBox(height: 8),

          // Location row
          Row(
            children: [
              Icon(Icons.location_on_outlined, color: Colors.red),
              SizedBox(width: 10),
              Text(subtitle2),
            ],
          ),

          SizedBox(height: 20),

          // Buttons row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => customCheckinDialog(context),
                  );
                },
                icon: Icon(
                  Icons.check_circle_outline_rounded,
                  color: Colors.white,
                ),
                label: Text(
                  title2,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(218, 154, 154, 154),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (context) => customCheckoutDialog(context),
                  );
                },
                icon: Icon(Icons.exit_to_app_rounded, color: Colors.white),
                label: Text(
                  title1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

/// Widget: Leave Details (Presence, Absence, Leaves)
Widget leaveDetails(
  String title1,
  String subtitle1,
  String title2,
  String subtitle2,
  String title3,
  String subtitle3,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(width: 15),
      _buildCard(title1, subtitle1, Color.fromARGB(255, 13, 100, 5)),
      SizedBox(width: 10),
      _buildCard(title2, subtitle2, Color.fromARGB(233, 164, 1, 1)),
      SizedBox(width: 10),
      _buildCard(title3, subtitle3, Color.fromARGB(255, 217, 125, 12)),
    ],
  );
}

/// Widget: Card used in leaveDetails
Widget _buildCard(String title, String subtitle, Color color) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        height: 120,
        width: 115,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: color,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 20,
                color: color,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ],
  );
}

/// Widget: Dashboard grid for Attendance / Leaves / Leave Status
Widget dashboard(
  String title1,
  String subtitle1,
  VoidCallback onTap1,
  String title2,
  String subtitle2,
  VoidCallback onTap2,
  String title3,
  String subtitle3,
  VoidCallback onTap3,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(width: 15),
      _dashboardItem(title1, subtitle1, onTap1),
      SizedBox(width: 10),
      _dashboardItem(title2, subtitle2, onTap2),
      SizedBox(width: 10),
      _dashboardItem(title3, subtitle3, onTap3),
    ],
  );
}

/// Widget: Dashboard item used in main dashboard
Widget _dashboardItem(String label, String assetPath, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 120,
      width: 115,
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(assetPath, height: 40),
          SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget custombottomnavigation(
  String title,
  String title1,
  String title2,
  String title3,
  int selectedIndex,
  Function(int) _onItemTapped,
) {
  return BottomNavigationBar(
    backgroundColor: Color.fromARGB(255, 255, 255, 255),
    selectedItemColor: Colors.blue,
    unselectedItemColor: Color.fromARGB(255, 157, 156, 156),
    currentIndex: selectedIndex,
    onTap: _onItemTapped,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: title),
      BottomNavigationBarItem(icon: Icon(Icons.history), label: title1),
      BottomNavigationBarItem(icon: Icon(Icons.holiday_village), label: title2),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: title3),
    ],
  );
}

Widget customscrollingbuttons({
  required List<String> titles,
  required int? selectedIndex, // Nullable
  required ValueChanged<int> onButtonTap,
}) {
  final icons = [
    Icons.calendar_month,
    Icons.timer,
    Icons.recycling,
    Icons.settings,
  ];

  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: List.generate(titles.length, (index) {
        final isSelected = selectedIndex == index;

        return Padding(
          padding: const EdgeInsets.only(left: 21),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isSelected
                      ? Color.fromARGB(255, 0, 125, 243)
                      : Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              side: BorderSide(
                color:
                    isSelected
                        ? Colors.transparent
                        : Colors.grey.withOpacity(0.5),
              ),
            ),
            onPressed: () => onButtonTap(index),
            icon: Icon(icons[index], color: Colors.grey),
            label: Text(titles[index], style: TextStyle(color: Colors.grey,fontSize: 13)),
          ),
        );
      }),
    ),
  );
}



Widget customRadioButtons({
  required String title,
  required String title1,
  required String title2,
  required String selectedButton,
  required ValueChanged<String?> onChanged,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(width: 25),
      Text(title),
      Radio<String>(
        value: title,
        groupValue: selectedButton,
        onChanged: onChanged,
        activeColor: Colors.blue,
      ),
      SizedBox(width: 15),
      Text(title1),
      Radio<String>(
        value: title1,
        groupValue: selectedButton,
        onChanged: onChanged,
        activeColor: Colors.blue,
      ),
      SizedBox(width: 15),
      Text(title2),
      Radio<String>(
        value: title2,
        groupValue: selectedButton,
        onChanged: onChanged,
        activeColor: Colors.blue,
      ),
      SizedBox(width: 15),
      IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
    ],
  );
}

Widget custommytasks(String title, String subtitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: Colors.green,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 12),
      Text(subtitle, style: TextStyle(color: Colors.grey, fontSize: 12)),
      Align(
        alignment: Alignment.bottomRight,
        child: SizedBox(
          width: 100,
          height: 30,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Start",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      SizedBox(height: 8),
      Divider(color: Colors.grey),
    ],
  );
}

Widget trackerItem({
  required String title,
  required String dueDate,
  required int progress, // value from 0 to 100
  required String remaining, // e.g. "3 days"
  required String priority, // "Low", "Medium", or "High"
  required String status, // "Not Started", "In Progress", etc.
  String selectedbutton = "start",
  required void Function(String?) onSelectionChanged,
}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title & Due Date
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              "Due Date: $dueDate",
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(children: [Text("Status: "), statusIndicator(status)]),
        SizedBox(height: 10),
        // Progress & Remaining
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Progress: "),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: CircularProgressIndicator(
                        value: progress / 100,
                        strokeWidth: 4,
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.green,
                      ),
                    ),
                    Text("$progress%", style: TextStyle(fontSize: 10)),
                  ],
                ),
              ],
            ),
            SizedBox(width: 25),
            Row(
              children: [
                Icon(Icons.timer, color: Colors.orange),
                SizedBox(width: 4),
                Text("$remaining left", style: TextStyle(color: Colors.orange)),
                SizedBox(width: 15),
                TextButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    minimumSize: Size(0, 0), // removes default min size
                    tapTargetSize:
                        MaterialTapTargetSize.shrinkWrap, // shrinks touch area
                  ),
                  icon: Icon(Icons.edit, size: 16, color: Colors.black),
                  onPressed: () {},
                  label: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Assigned by",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color.fromARGB(255, 2, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "(optional)",
                        style: TextStyle(fontSize: 11, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),

        // Priority
        Row(
          children: [
            Text("Priority: "),
            Text(
              priority,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    priority == "High"
                        ? Colors.red
                        : priority == "Medium"
                        ? Colors.orange
                        : Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),

        // Status
        Row(
          children: [
            Radio<String>(
              value: "option1",
              groupValue: selectedbutton,
              onChanged: onSelectionChanged,
              activeColor: Color.fromARGB(255, 33, 215, 243),
            ),
            Text("Start", style: TextStyle(fontSize: 12)),
            SizedBox(width: 30),
            Radio<String>(
              value: "option1",
              groupValue: selectedbutton,
              onChanged: onSelectionChanged,
              activeColor: Color.fromARGB(255, 134, 173, 20),
            ),
            Text("Update", style: TextStyle(fontSize: 12)),
            SizedBox(width: 20),
            Radio<String>(
              value: "option1",
              groupValue: selectedbutton,
              onChanged: onSelectionChanged,
              activeColor: Color.fromARGB(255, 5, 211, 101),
            ),
            Text("Complete", style: TextStyle(fontSize: 12)),
          ],
        ),
        Divider(color: Colors.grey),
      ],
    ),
  );
}

Widget statusIndicator(String label) {
  Color color;
  switch (label) {
    case "Not Started":
      color = Colors.grey;
      break;
    case "In progress":
      color = Colors.blue;
      break;
    case "Completed":
      color = Colors.green;
      break;
    case "Overdue":
      color = Colors.red;
      break;
    default:
      color = Colors.black;
  }

  return Row(
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      SizedBox(width: 6),
      Text(label, style: TextStyle(fontSize: 12)),
    ],
  );
}

Widget ongoingItemSimple({
  required String title,
  required String status,
  required String completion,
  required String completionDate,
  required String priority,
  required String startDate,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Title and Completion
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            Text(
              completion,
              style: TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ],
        ),

        SizedBox(height: 30),

        /// Status
        Row(
          children: [
            Text("Status: ", style: TextStyle(fontSize: 12)),
            Text(
              status,
              style: TextStyle(
                fontSize: 12,
                color: getStatusColor(status),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        SizedBox(height: 6),

        /// Start Date
        Row(
          children: [
            Text("Start: ", style: TextStyle(fontSize: 12)),
            Text(
              startDate,
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),

        SizedBox(height: 4),

        /// Completion or Due Date
        Row(
          children: [
            Text(
              status.toLowerCase() == 'in progress'
                  ? "Expected Date: "
                  : status.toString() == 'Pending'
                  ? "Due Date: "
                  : status.toString() == 'Completed'
                  ? "Done: "
                  : "Default:",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              completionDate,
              style: TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),

        SizedBox(height:20),

        /// Priority
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Priority:", style: TextStyle(fontSize: 12)),
            Text(
              priority,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: getprioritycolr(priority),
              ),
            ),
            SizedBox(width: 130),
            SizedBox(
              width: 150,
              height: 35,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Mark as done",
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Divider(color: Colors.grey),
      ],
    ),
  );
}

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'in progress':
      return Colors.blue;
    case 'pending':
      return Colors.orange;
    case 'completed':
      return Colors.green;
    default:
      return Colors.black;
  }
}

Color getprioritycolr(String priority) {
  switch (priority.toLowerCase()) {
    case 'low':
      return Colors.green;
    case 'medium':
      return Colors.orange;
    case 'high':
      return Colors.red;
    default:
      return Colors.black;
  }
}

Widget metricGrid(List<Map<String, dynamic>> items) {
  List<Widget> rows = [];

  for (int i = 0; i < items.length; i += 2) {
    final first = items[i];
    final second = i + 1 < items.length ? items[i + 1] : null;

    rows.add(
      Row(
        children: [
          Expanded(
            child: metricCard(
              icon: first['icon'],
              label: first['label'],
              value: first['value'],
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child:
                second != null
                    ? metricCard(
                      icon: second['icon'],
                      label: second['label'],
                      value: second['value'],
                    )
                    : SizedBox(), // Empty to balance row if odd number
          ),
        ],
      ),
    );

    rows.add(SizedBox(height: 12)); // spacing between rows
  }

  return Padding(padding: EdgeInsets.all(16.0), child: Column(children: rows));
}

Widget metricCard({
  required IconData icon,
  required String label,
  required String value,
}) {
  return SizedBox(
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 242, 242, 242),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
