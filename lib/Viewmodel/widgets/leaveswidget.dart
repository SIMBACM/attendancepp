import 'package:flutter/material.dart';

String? selectedLeaveType;

Widget customlogoincircleavatar(String assetPath, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pop(context);
    },
    child: CircleAvatar(
      backgroundColor: Colors.white,
      backgroundImage: AssetImage(assetPath),
      radius: 30,
    ),
  );
}

Widget customsearchbar(String title, BuildContext context) {
  return SizedBox(
    height: 60,
    width: 200,
    child: ElevatedButton(
      onPressed: () {
        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: "Dialog",
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder: (context, anim1, anim2) {
            return Align(
              alignment: Alignment.topCenter,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  margin: EdgeInsets.only(
                    top: 40,
                  ), // Push below status bar, OVER app bar
                  width: 600,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title row with back + button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.arrow_back,
                                size: 20,
                                color: Colors.black,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "05 May 2025",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xFFA2C511), // Greenish like image
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.all(6),
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Search History",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(left: 23),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sick Leave....",
                              style: TextStyle(color: Color(0xFF9B9797)),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "23 May 2025",
                              style: TextStyle(color: Color(0xFF9B9797)),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Casual leaves ...",
                              style: TextStyle(color: Color(0xFF9B9797)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        alignment: Alignment.centerLeft,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey),
        ),
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 12),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 8),
          Text(title, style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    ),
  );
}

Widget customnotificationicon() {
  return CircleAvatar(
    backgroundColor: Colors.blue,
    child: Icon(Icons.notifications_active_outlined, color: Colors.white),
  );
}

Widget customuserlogo(String title) {
  return Container(
    padding: EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: CircleAvatar(
      backgroundColor: Color.fromARGB(255, 220, 217, 237),
      child: Text(
        title[0].toUpperCase(),
        style: TextStyle(color: Colors.black),
      ),
    ),
  );
}

Widget customelevatedbutton(
  BuildContext context,
  String title1,
  String title2,
  int selectedIndex,
  void Function(int) onselected,
) {
  return Container(
    width: 350,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton.icon(
          icon: Icon(
            Icons.widgets,
            color: selectedIndex == 0 ? Colors.blue : Colors.grey,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(),
          ),
          onPressed: () {
            onselected(0);
          },
          label: Text(
            title1,
            style: TextStyle(
              color: selectedIndex == 0 ? Colors.blue : Colors.grey,
            ),
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton.icon(
          icon: Icon(
            Icons.request_page,
            color: selectedIndex == 1 ? Colors.blue : Colors.grey, // FIXED
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(),
          ),
          onPressed: () {
            onselected(1);
          },
          label: Text(
            title2,
            style: TextStyle(
              color: selectedIndex == 1 ? Colors.blue : Colors.grey, // FIXED
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customtext(String title) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget customtextfield(String title) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
      readOnly: true,

      style: TextStyle(fontSize: 11, color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline, size: 20, color: Colors.grey),
        hintText: title,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    ),
  );
}

Widget customtextfield2(String title) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: TextField(
      readOnly: true,
      style: TextStyle(fontSize: 11, color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.calendar_month, size: 20, color: Colors.grey),
        hintText: title,
        hintStyle: TextStyle(color: Color.fromARGB(255, 160, 158, 158)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    ),
  );
}

Widget customstyledtext(String title) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(title, style: TextStyle(fontSize: 15, color: Colors.black)),
      ],
    ),
  );
}

Widget customstyledtext5(String title1, String title2) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      children: [
        Text(
          title1,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color.fromARGB(72, 57, 56, 56),
          ),
        ),
        SizedBox(width: 180),
        Text(
          title2,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color.fromARGB(72, 57, 56, 56),
          ),
        ),
      ],
    ),
  );
}

Widget customTextFieldDate({
  required DateTime? fromDate,
  required DateTime? toDate,
  required void Function(bool isFromDate) onTap,
}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onTap(true), // true = fromDate
            child: AbsorbPointer(
              child: Material(
                color: Colors.white,
                elevation: 1,
                shadowColor: Colors.black26,
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "From",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    hintText:
                        fromDate != null
                            ? "${fromDate.day}/${fromDate.month}/${fromDate.year}"
                            : "Select date",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        Icon(Icons.arrow_left_rounded),
        Icon(Icons.arrow_right_rounded),
        Expanded(
          child: GestureDetector(
            onTap: () => onTap(false), // FIXED: false = toDate
            child: AbsorbPointer(
              child: Material(
                color: Colors.white,
                elevation: 1,
                shadowColor: Colors.black26,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "To",
                    labelStyle: TextStyle(fontSize: 12, color: Colors.grey),
                    hintText:
                        toDate != null
                            ? "${toDate.day}/${toDate.month}/${toDate.year}"
                            : "Select date",
                    prefixIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget customtextleave(
  String title1,
  String title2,
  String? selectedValue,
  void Function(String?) onChanged,
) {
  return Row(
    children: [
      // First text field
      Expanded(
        child: Material(
          elevation: 1,
          shadowColor: Colors.black26,
          child: TextField(
            style: TextStyle(fontSize: 11, color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.exit_to_app, color: Colors.grey, size: 20),
              hintText: title1,
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 160, 158, 158),
                fontSize: 10,
              ),
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
          ),
        ),
      ),

      SizedBox(width: 10),

      // Second field as dropdown
      Expanded(
        child: Material(
          elevation: 4,
          shadowColor: Colors.black26,
          child: DropdownButtonFormField<String>(
            value: selectedValue,
            onChanged: onChanged,
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.vertical_align_top_rounded,
                color: Colors.grey,
                size: 20,
              ),
              hintText: title2, // appears when no value is selected
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 160, 158, 158),
                fontSize: 10,
              ),
              filled: true,
              fillColor: Colors.white,
              border: InputBorder.none,
            ),
            style: TextStyle(fontSize: 11, color: Colors.black),
            items:
                ['Sick Leave', 'Casual Leave', 'Emergency Leave']
                    .map(
                      (type) =>
                          DropdownMenuItem(value: type, child: Text(type)),
                    )
                    .toList(),
          ),
        ),
      ),
    ],
  );
}

Widget customtextarea(String title) {
  return TextField(
    maxLines: 3,
    style: TextStyle(fontSize: 14, color: Colors.black),
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.vertical_align_top_rounded),
      hintText: title,
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 160, 158, 158),
        fontSize: 10,
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey),
      ),
    ),
  );
}

Widget customelevatedbutton2(BuildContext context, String title) {
  return Container(
    width: 400,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        title,
        style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      ),
    ),
  );
}

Widget customattachments(String title) {
  return Material(
    elevation: 4,
    shadowColor: Colors.black26,
    child: TextField(
      style: TextStyle(fontSize: 14, color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.attach_file),
        hintText: title,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 160, 158, 158),
          fontSize: 10,
        ),
        filled: true,
        fillColor: Colors.white,
        border: InputBorder.none,
      ),
    ),
  );
}

Widget leaveFormSection(BuildContext context) {
  return StatefulBuilder(
    builder: (context, setState) {
      DateTime? fromDate;
      DateTime? toDate;

      void selectDate(bool isFromDate) async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          setState(() {
            if (isFromDate) {
              fromDate = pickedDate;
            } else {
              toDate = pickedDate;
            }
          });
        }
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customtext("Apply for leave"),
          SizedBox(height: 10),

          customstyledtext("Employee name"),
          customtextfield("Employee name - auto filled"),
          SizedBox(height: 10),

          customstyledtext("Employee id"),
          customtextfield2("Employee id - auto filled"),
          SizedBox(height: 10),

          customstyledtext5("From", "To"),
          SizedBox(height: 10),

          customTextFieldDate(
            fromDate: fromDate,
            toDate: toDate,
            onTap: (isFrom) => selectDate(isFrom),
          ),
          SizedBox(height: 20),

          customtextleave("Leave type", "Choose type", selectedLeaveType, (
            value,
          ) {
            setState(() {
              selectedLeaveType = value;
            });
          }),
          SizedBox(height: 20),

          customtext("Reason"),
          SizedBox(height: 10),

          Material(
            elevation: 4,
            shadowColor: Colors.black26,
            child: SizedBox(
              height: 120,
              child: TextField(
                maxLines: null,
                expands: true,
                style: TextStyle(fontSize: 14, color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Text area",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 160, 158, 158),
                    fontSize: 12,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),

          customtext("Attachments"),
          SizedBox(height: 10),
          customattachments("Attachments(optional)"),
          SizedBox(height: 10),
          Divider(color: Colors.grey, thickness: 1),
          SizedBox(height: 10),

          customelevatedbutton2(context, "Submit"),
          SizedBox(height: 10),
        ],
      );
    },
  );
}
