import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:texge/utils/color/colors.dart';
import 'package:texge/utils/size/constant_height.dart';
import 'package:texge/utils/text/custom_text';
import 'package:texge/view/order_list/widgets/cusom_appbar_widget.dart';
import 'package:texge/view/order_list/widgets/order_list_widget.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  State<OrderListScreen> createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final EasyInfiniteDateTimelineController _controller = EasyInfiniteDateTimelineController();

  DateTime? _focusDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 78, 78, 78),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppbarWidget(),
            const KHeight(size: 0.02),
            EasyInfiniteDateTimeLine(
              activeColor: themeColor,
              showTimelineHeader: false,
              selectionMode: const SelectionMode.autoCenter(),
              controller: _controller,
              firstDate: DateTime(2024),
              focusDate: _focusDate,
              lastDate: DateTime(2024, 12, 31),
              dayProps: const EasyDayProps(
                todayNumStyle: TextStyle(color: whiteColor),
                todayHighlightStyle: TodayHighlightStyle.withBorder,
                todayStyle: DayStyle(
                    borderRadius: 10.0,
                    dayNumStyle: TextStyle(fontSize: 24, color: whiteColor),
                    decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide(color: whiteColor)), borderRadius: BorderRadius.all(Radius.circular(10)))),
                activeDayStyle: DayStyle(borderRadius: 10.0, dayNumStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: whiteColor)),
                inactiveDayStyle: DayStyle(borderRadius: 10.0, dayNumStyle: TextStyle(fontSize: 24, color: whiteColor)),
              ),
              onDateChange: (selectedDate) {
                setState(() {
                  _focusDate = selectedDate;
                });
              },
            ),
            const KHeight(size: 0.02),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(
                text: "Order List",
                color: whiteColor,
                fontSize: 26,
                fontWeight: FontWeight.w500,
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const OrderListWidget(
                    status: "Complete",
                    orderId: "TXG24/0012",
                    date: "22/05/2024",
                    totalItems: "2",
                  );
                },
              ),
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
