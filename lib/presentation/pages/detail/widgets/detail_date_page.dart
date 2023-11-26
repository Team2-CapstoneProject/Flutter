import 'package:capstone_project_villa/presentation/pages/detail/widgets/detail_payment_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:capstone_project_villa/common/constants.dart';
import 'package:capstone_project_villa/common/utils.dart';
import 'package:capstone_project_villa/data/models/request/transaction_request_model.dart';
import 'package:capstone_project_villa/data/models/response/detail_response_model.dart';
import 'package:capstone_project_villa/presentation/bloc/transaction/transaction_bloc.dart';
import 'package:capstone_project_villa/presentation/widgets/custom_button.dart';

class DetailDatePage extends StatefulWidget {
  final Vila vilas;
  const DetailDatePage({
    Key? key,
    required this.vilas,
  }) : super(key: key);

  @override
  State<DetailDatePage> createState() => _DetailDatePageState();
}

class _DetailDatePageState extends State<DetailDatePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  int _nNight = 0;

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

  int calculateNumberOfDays(DateTime start, DateTime end) {
    Duration difference = end.difference(start);
    return difference.inDays;
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;

      if (_rangeStart != null && _rangeEnd != null) {
        int numberOfNights = calculateNumberOfDays(_rangeStart!, _rangeEnd!);
        _nNight = numberOfNights;
      }

      // if (_rangeStart != null && _rangeEnd != null) {
      // int numberOfDays = calculateNumberOfDays(_rangeStart!, _rangeEnd!);
      // nNight = numberOfDays;

      // context.read<TransactionBloc>().add(
      //       GetTransaction(
      //         transactionRequestModel: TransactionRequestModel(
      //           vila_id: widget.vilas.id,
      //           n_night: _nNight,
      //         ),
      //       ),
      //     );

      // print("Number of days: $numberOfDays");
      // }
      // print(_rangeStart);
      // print(_rangeEnd);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: currentTheme ? Color(0xff1E1E1E) : whiteColor,
          statusBarIconBrightness:
              currentTheme ? Brightness.light : Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: currentTheme ? whiteColor : darkGrey,
        ),
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
      bottomNavigationBar: Container(child: calculateTotalPrice()),
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
                rangeStartDecoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                rangeEndDecoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                weekendTextStyle: TextStyle(color: Colors.red)),
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
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Check in',
              style: currentTheme
                  ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium)
                  : blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
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
                      color: currentTheme ? whiteColor : darkGrey,
                    ),
                  ),
                  Text(
                    _rangeStart == null
                        ? 'Select'
                        : Utils.dateTimeFormat2(_rangeStart!),
                    style: currentTheme
                        ? whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium)
                        : blueBlackTextStyle.copyWith(
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
            color: currentTheme ? whiteColor : darkGrey,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Check Out',
              style: currentTheme
                  ? whiteTextStyle.copyWith(fontSize: 14, fontWeight: medium)
                  : blackTextStyle.copyWith(fontSize: 14, fontWeight: medium),
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
                      color: currentTheme ? whiteColor : darkGrey,
                    ),
                  ),
                  Text(
                    _rangeEnd == null
                        ? 'Select'
                        : Utils.dateTimeFormat2(_rangeEnd!),
                    style: currentTheme
                        ? whiteTextStyle.copyWith(
                            fontSize: 14, fontWeight: medium)
                        : blueBlackTextStyle.copyWith(
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

  Widget calculateTotalPrice() {
    bool currentTheme = Theme.of(context).brightness == Brightness.dark;
    double totalPrice;

    if (_rangeStart != null && _rangeEnd != null) {
      totalPrice = _nNight * widget.vilas.price.toDouble();
    } else {
      totalPrice = widget.vilas.price.toDouble();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: MediaQuery.of(context).size.height * 0.16,
      color: currentTheme ? Color(0xff1E1E1E) : whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 12),
            child: RichText(
              text: TextSpan(
                style: blueBlackTextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: semiBold,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '${Utils.currencyFormat(totalPrice.toInt())} ',
                    style: TextStyle(
                      color: currentTheme ? whiteColor : blackColor,
                    ),
                  ),
                  TextSpan(
                    text: 'night'.tr(),
                    style: grey100kTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocConsumer<TransactionBloc, TransactionState>(
              listener: (context, state) {
            if (state is TransactionLoaded) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPaymentPage(
                    data: state.transactionResponse, nNight: _nNight,
                  ),
                ),
              );
            }
          }, builder: (context, state) {
            if (state is TransactionLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return CustomButton(
                onPressed: () {
                  if (_rangeStart != null && _rangeEnd != null) {
                    String tglCheckin = Utils.dateTimeFormat5(_rangeStart!);
                    String tglCheckout = Utils.dateTimeFormat5(_rangeEnd!);

                    final transactionModel = TransactionRequestModel(
                      vilaId: widget.vilas.id,
                      nNight: _nNight,
                      tglCheckin: tglCheckin,
                      tglCheckout: tglCheckout,
                    );

                    // print(transactionModel);

                    context.read<TransactionBloc>().add(
                          GetTransaction(
                            transactionRequestModel: transactionModel,
                          ),
                        );
                  }
                },
                text: 'book_now'.tr());
          })
        ],
      ),
    );
  }
}
