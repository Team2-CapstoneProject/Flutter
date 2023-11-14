import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:table_calendar/table_calendar.dart';

class DetailDatePage extends StatefulWidget {
  const DetailDatePage({super.key});

  @override
  State<DetailDatePage> createState() => _DetailDatePageState();
}

class _DetailDatePageState extends State<DetailDatePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    _selectedDay = _focusedDay;
    super.initState();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      print(_rangeStart);
      print(_rangeEnd);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        iconTheme: IconThemeData(color: darkGrey),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                content(),
                review(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 30),
          child: TableCalendar(
            locale: 'id_ID',
            rowHeight: 50,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            calendarFormat: _calendarFormat,
            onDaySelected: _onDaySelected,
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            onRangeSelected: _onRangeSelected,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            focusedDay: _focusedDay,
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
            calendarStyle: CalendarStyle(
              outsideDaysVisible: false,
            ),
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
        )
      ],
    );
  }

  Widget review() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Check in',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 36,
              width: 130,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFCBD5E1),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Icon(
                      Iconsax.calendar_1,
                      color: darkGrey,
                    ),
                  ),
                  Text(
                    _rangeStart == null
                        ? 'Select'
                        : Utils.dateTimeFormat2(_rangeStart!),
                    style: blueBlackTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 22, vertical: 5),
          child: Icon(
            Iconsax.arrow_right_1,
            color: darkGrey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Check Out',
              style: blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 36,
              width: 130,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFCBD5E1),
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Icon(
                      Iconsax.calendar_1,
                      color: darkGrey,
                    ),
                  ),
                  Text(
                    _rangeEnd == null
                        ? 'Select'
                        : Utils.dateTimeFormat2(_rangeEnd!),
                    style: blueBlackTextStyle.copyWith(
                        fontSize: 14, fontWeight: medium),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
