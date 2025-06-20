import 'package:flutter/material.dart';

Widget mergedLeaveDashboard() {
  final titles = [
    'Total leave taken',
    'Approval rate',
    'Pending request',
    'Team member on leave',
  ];
  final subtitles = ['16 days', '92%', '1', '2'];
  final labels = [
    '25 days remaining this year',
    '25 days remaining this year',
    '25 days remaining this year',
    '25 days remaining this year',
  ];

  final icons = [
    Icons.badge,
    Icons.check_circle,
    Icons.hourglass_empty,
    Icons.group,
  ];

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: buildcontainer(titles[0], subtitles[0], labels[0], icons[0]),
          ),
          SizedBox(width: 12),
          Expanded(
            child: buildcontainer(titles[1], subtitles[1], labels[1], icons[1]),
          ),
        ],
      ),
      Divider(thickness: 1, height: 30),
      SizedBox(height: 12),
      Row(
        children: [
          Expanded(
            child: buildcontainer(titles[2], subtitles[2], labels[2], icons[2]),
          ),
          SizedBox(width: 12),
          Expanded(
            child: buildcontainer(titles[3], subtitles[3], labels[3], icons[3]),
          ),
        ],
      ),
      Divider(thickness: 1, height: 31),

      Text(
        "Leave Overview",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      SizedBox(height: 4),
      Text(
        "Your leave distribution for the current year",
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      SizedBox(height: 100),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end, // Align all bars to bottom
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 60, height: 50, color: Colors.blue),
              SizedBox(height: 6),
              Text("Q1"),
            ],
          ),
          SizedBox(width: 30),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 60, height: 40, color: Colors.blue),
              SizedBox(height: 6),
              Text("Q2"),
            ],
          ),
          SizedBox(width: 20),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 60, height: 30, color: Colors.blue),
              SizedBox(height: 6),
              Text("Q3"),
            ],
          ),
          SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 60, height: 20, color: Colors.blue),
              SizedBox(height: 6),
              Text("Q4"),
            ],
          ),
        ],
      ),
      SizedBox(height: 13),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
          ),
          SizedBox(width: 5),
          Text(
            "Leave days taken",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Divider(thickness: 1, height: 31),
      SizedBox(height: 12),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("Total days\n20"), Text("Remaining\n29")],
      ),
      SizedBox(height: 5),
      Divider(thickness: 1, height: 31),
      Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color.fromARGB(26, 228, 224, 224),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upcoming Leave",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Your scheduled time off",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Annual Leave"),
                  Text(
                    "April 22, 2025 to April 24, 2025 (3 days)",
                    style: TextStyle(
                      fontSize: 12,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text("Pending", style: TextStyle(fontSize: 12)),
            ),
          ],
        ),
      ),
      SizedBox(height: 20),
      Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color.fromARGB(237, 255, 231, 182),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Icon(
                Icons.info_outline,
                color: Color.fromARGB(255, 173, 137, 83),
                size: 32, 
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Pending Approval",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.brown,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Your leave request is awaiting manager approval.",
                    style: TextStyle(fontSize: 14, color: Colors.brown[800]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildcontainer(
  String title,
  String subtitles,
  String labels,
  IconData icon,
) {
  return Container(
    width: 170,
    height: 130,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 255, 255, 255),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            SizedBox(width: 8),
            Icon(icon, size: 30, color: Colors.blueAccent),
            SizedBox(width: 8),
          ],
        ),
        SizedBox(height: 22),
        Text(
          subtitles,
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 15),
        Expanded(
          child: Text(
            labels,
            style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
          ),
        ),
      ],
    ),
  );
}





// Widget mergedLeaveDashboard() {
//   final titles = ['Total leave taken', 'Approval rate', 'Pending request', 'Team member on leave'];
//   final subtitles = ['16 days', '92%', '1', '2'];
//   final labels = ['25 days remaining this year', '25 days remaining this year', '25 days remaining this year', '25 days remaining this year'];

//   return SingleChildScrollView(
//     padding:  EdgeInsets.all(16),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Card Layout (2 Cards per Row)
//         Column(
//           children: List.generate(2, (rowIndex) {
//             return Padding(
//               padding:  EdgeInsets.only(bottom: 12),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: List.generate(2, (colIndex) {
//                   final index = rowIndex * 2 + colIndex;
//                   return Padding(
//                     padding:  EdgeInsets.only(right: 1  ),
//                     child: Container(
//                       height: 115,
//                       width: 175,
//                       padding:  EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.2),
//                             blurRadius: 4,
//                             offset:  Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(titles[index], style:  TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//                            SizedBox(height: 18),
//                           Text(subtitles[index], style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                            SizedBox(height: 12),
//                           Text(labels[index], style:  TextStyle(fontSize: 11)),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             );
//           }),
//         ),

//          Divider(height: 30, thickness: 1),

//         // Leave Overview Title
//          Text(
//           "Leave Overview",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//         ),
//          SizedBox(height: 4),
//          Text(
//           "Your leave distribution for the current year",
//           style: TextStyle(color: Colors.grey, fontSize: 12),
//         ),
//          SizedBox(height: 20),

//         // Bar Graph for Quarters
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             for (var q in [
//               {"label": "Q1", "percent": 1.0},
//               {"label": "Q2", "percent": 0.6},
//               {"label": "Q3", "percent": 0.3},
//               {"label": "Q4", "percent": 0.8},
//             ])
//               Column(
//                 children: [
//                   Container(
//                     width: 40,
//                     height: 50,
//                     alignment: Alignment.bottomCenter,
//                     child: FractionallySizedBox(
//                       heightFactor: q["percent"] as double,
//                       child: Container(color: Colors.blue),
//                     ),
//                   ),
//                    SizedBox(height: 4),
//                   Text(q["label"] as String),
//                 ],
//               ),
//           ],
//         ),

//          SizedBox(height: 8),

//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               width: 8,
//               height: 8,
//               decoration:  BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.blue,
//               ),
//             ),
//              SizedBox(width: 6),
//              Text(
//               "Leave days taken",
//               style: TextStyle(fontSize: 12),
//             ),
//           ],
//         ),

//          SizedBox(height: 12),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children:  [
//             Text("Total days\n20", textAlign: TextAlign.center),
//             Text("Remaining\n29", textAlign: TextAlign.center),
//           ],
//         ),
//          Divider(height: 30, thickness: 1),

//          Text(
//           "Upcoming Leave",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//          SizedBox(height: 4),
//          Text(
//           "Your scheduled time off",
//           style: TextStyle(color: Colors.grey, fontSize: 12),
//         ),
//          SizedBox(height: 12),

//         Container(
//           padding:  EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color:  Color.fromARGB(255, 245, 245, 245),
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.grey.shade300),
//           ),
//           child: Row(
//             children: [
//                Icon(Icons.event_note, size: 30),
//                SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children:  [
//                     Text("Annual Leave"),
//                     Text(
//                       "April 22, 2025 to April 24, 2025 (3 days)",
//                       style: TextStyle(fontSize: 12, color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child:  Text("Pending", style: TextStyle(fontSize: 12)),
//               ),
//             ],
//           ),
//         ),

//          SizedBox(height: 20),
//         Row(
//           children:  [
//             Icon(Icons.info_outline, size: 18, color: Colors.orange),
//             SizedBox(width: 6),
//             Expanded(
//               child: Text(
//                 "Your leave request is awaiting manager approval.",
//                 style: TextStyle(fontSize: 12),
//               ),
//             )
//           ],
//         ),
//       ],
//     ),
//   );
// }


