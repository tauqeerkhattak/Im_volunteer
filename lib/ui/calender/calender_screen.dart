import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:i_am_volunteer/controllers/calender_screen_controller.dart';
import 'package:i_am_volunteer/utils/app_colors.dart';
import 'package:i_am_volunteer/widgets/custom_text.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../widgets/custom_scaffold.dart';

class CalenderScreen extends StatelessWidget{
  final controller = Get.find<CalenderScreenController>();
  CalenderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: _getBody(),
      onWillPop: controller.onWillPop,
      scaffoldKey: controller.scaffoldKey,
      screenName: 'Calender Screen',);
  }
  Widget _getBody(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10)),
              child: Center(child: CustomText(text: 'Event Calender',fontSize: 20,color: AppColors.white,weight: FontWeight.w800,),),
            ),
            Obx(
              ()=> TableCalendar(
                firstDay: controller.kFirstDay,
                lastDay: controller.kLastDay,
                focusedDay: controller.focusedDay.value,
                calendarFormat: controller.calendarFormat.value,
                headerStyle: HeaderStyle(
                  formatButtonDecoration: BoxDecoration(color: AppColors.white,borderRadius: BorderRadius.circular(14),border: Border.all(color: AppColors.primary))
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(color: AppColors.primary,shape: BoxShape.circle)
                ),
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(controller.selectedDay.value, selectedDay)) {
                      controller.selectedDay.value = selectedDay;
                      controller.focusedDay.value = focusedDay;
                  }
                },
                /*onFormatChanged: (format) {
                  if (controller.calendarFormat.value != format) {
                      controller.calendarFormat.value = format;
                  }
                },*/
                onPageChanged: (focusedDay) {
                  controller.focusedDay.value = focusedDay;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}