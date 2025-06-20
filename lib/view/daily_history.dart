import 'package:all_project/model/attendancedatamodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyHistory extends StatefulWidget {
   DailyHistory({super.key});

  @override
  State<DailyHistory> createState() => _DailyHistoryState();
}

class _DailyHistoryState extends State<DailyHistory> {
  DateTime? _Date;
  String _selectedStatus = 'All';
  List<AttendanceRecord> _filteredRecords = [];

  Future<void> _selectDate(BuildContext context, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _Date = picked;
        }
      });
    }
  }

  void initState() {
    super.initState();
    _filteredRecords = _attendanceRecords;
  }

  final List<AttendanceRecord> _attendanceRecords = [
    AttendanceRecord(
      date: DateTime(2025, 6, 7),
      checkIn: "9:00 AM",
      checkOut: "5:00 PM",
      status: "Present",
      location: "HQ Office",
    ),
    AttendanceRecord(
      date: DateTime(2025, 6, 6),
      checkIn: "9:30 AM",
      checkOut: "",
      status: "Late",
      location: "Remote",
    ),
    AttendanceRecord(
      date: DateTime(2025, 6, 5),
      checkIn: "",
      checkOut: "",
      status: "Absent",
    ),
    AttendanceRecord(
      date: DateTime(2025, 7, 5),
      checkIn: "",
      checkOut: "",
      status: "Leave",
    ),
    AttendanceRecord(
      date: DateTime(2024, 10, 12),
      checkIn: "9:00 AM",
      checkOut: "5:00 PM",
      status: "Present",
      location: "Palakkad",
    ),
    AttendanceRecord(
      date: DateTime(2024, 12, 14),
      checkIn: "",
      checkOut: "",
      status: "Absent",
      location: "Kochi",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(175),
        child: Stack(
          children: [
            // first circle green
            Positioned(
              top: -100,
              left: -10,
              child: Container(
                width: 280,
                height: 280,
                decoration:  BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(350),
                  ),
                ),
              ),
            ),

            //overlappin circle blue
            Positioned(
              top: -80,
              left: -50,
              child: Container(
                width: 280,
                height: 280,
                decoration:  BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(350),
                  ),
                ),
              ),
            ),

            // For attendance history text
            Container(
              alignment: Alignment.bottomCenter,
              child:  Text(
                "Attendance History",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Filter Section
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            padding:  EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Date Range Pickers
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () => _selectDate(context, true),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: 'Date',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            _Date == null
                                ? 'Select Date'
                                : DateFormat.yMd().format(_Date!),
                          ),
                        ),
                      ),
                    ),
                     SizedBox(width: 10),
                  ],
                ),
                 SizedBox(height: 20),
                // Status Filter
                DropdownButtonFormField<String>(
                  value: _selectedStatus,
                  items:
                      ['All', 'Present', 'Absent', 'Late', 'Leave']
                          .map(
                            (status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                 SizedBox(height: 16),
                // Apply Filters Button
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _filteredRecords =
                            _attendanceRecords.where((record) {
                              final matchesDate =
                                  _Date == null ||
                                  (record.date.year == _Date!.year &&
                                      record.date.month == _Date!.month &&
                                      record.date.day == _Date!.day);
                              final matchesStatus =
                                  _selectedStatus == 'All' ||
                                  record.status == _selectedStatus;
                              return matchesDate && matchesStatus;
                            }).toList();
                      });
                    },

                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child:  Text("Apply Filters"),
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredRecords.length,
              itemBuilder: (context, index) {
                final record = _filteredRecords[index];

                Color statusColor;
                switch (record.status) {
                  case 'Present':
                    statusColor = Colors.green;
                    break;
                  case 'Absent':
                    statusColor = Colors.red;
                    break;
                  case 'Late':
                    statusColor = Colors.orange;
                    break;
                  default:
                    statusColor = Colors.grey;
                }

                return Card(
                  elevation: 1.5,
                  margin:  EdgeInsets.symmetric(vertical: 6),
                  child: Padding(
                    padding:  EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat.yMMMMd().format(record.date),
                          style:  TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                         SizedBox(height: 8),
                        Row(
                          children: [
                             Icon(
                              Icons.access_time,
                              color: Colors.green,
                              size: 20,
                            ),
                             SizedBox(width: 6),
                            Text(
                              record.checkIn.isEmpty ? 'N/A' : record.checkIn,
                            ),
                             SizedBox(width: 20),
                            Icon(
                              Icons.exit_to_app,
                              color:
                                  record.checkOut.isEmpty
                                      ? Colors.red
                                      : Colors.green,
                              size: 20,
                            ),
                             SizedBox(width: 6),
                            Text(
                              record.checkOut.isEmpty ? 'N/A' : record.checkOut,
                            ),
                          ],
                        ),
                         SizedBox(height: 8),
                        Container(
                          padding:  EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            record.status,
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        if (record.location != null) ...[
                           SizedBox(height: 8),
                          Row(
                            children: [
                               Icon(
                                Icons.location_on,
                                size: 14,
                                color: Colors.grey,
                              ),
                               SizedBox(width: 4),
                              Text(
                                record.location!,
                                style:  TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Additional content (e.g. attendance list) can go here
        ],
      ),
    );
  }
}
