import 'package:flutter/material.dart';

import '../component/theme/i_colors.dart';


class IShowDatePicker {
  static Future<DateTime?> dateOfBirth(
    BuildContext context, {
    DatePickerEntryMode initialEntryMode = DatePickerEntryMode.calendar,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    DateTime firstDateDefault = firstDate ?? DateTime(DateTime.now().year - 150);
    DateTime lastDateDefault = lastDate ?? DateTime.now();

    if (lastDateDefault.isAfter(DateTime.now())) {
      lastDateDefault = DateTime.now();
    }

    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDateDefault,
      lastDate: lastDateDefault,
      initialEntryMode: initialEntryMode,
      cancelText: 'Kembali',
      confirmText: 'Pilih',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Palette.primary,
              surfaceTint: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Dialog(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: <Widget>[
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.max,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               context.sbHeight(),
  //               Text(
  //                 'Pilih Tanggal',
  //                 style: context.captionBold,
  //               ),
  //               context.sbHeight(),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: Text(
  //                       selectedDate,
  //                       style: context.headline2,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //         const Divider(color: Palette.blackFont),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
  //           child: _buildDateRangePicker(
  //             context,
  //             initialSelectedRange: widget.initialPickerRangeDate,
  //             selectionMode: widget.selectionMode,
  //             initialSelectedDates: widget.initialSelectedDates,
  //           ),
  //         ),
  //         const Divider(color: Palette.neutral40),
  //         Padding(
  //           padding: const EdgeInsets.fromLTRB(16, 4, 16, 16),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               context.sbWidth(),
  //               Expanded(
  //                 child: SizedBox(
  //                   height: 40,
  //                   child: IOutlineButton.custom(
  //                     onPressed: () {
  //                       context.pop();
  //                     },
  //                     title: 'cancel'.tr,
  //                     padding: EdgeInsets.zero,
  //                   ),
  //                 ),
  //               ),
  //               context.sbWidth(),
  //               Expanded(
  //                 child: SizedBox(
  //                   height: 40,
  //                   child: IButton.custom(
  //                     onPressed: canChoose ? setValueDate : null,
  //                     title: 'choose'.tr,
  //                     padding: EdgeInsets.zero,
  //                   ),
  //                 ),
  //               ),
  //               context.sbWidth(),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
  //
  // Widget _buildDateRangePicker(
  //   BuildContext context, {
  //   IDateTimeRange? initialSelectedRange,
  //   List<DateTime>? initialSelectedDates,
  //   DateRangePickerSelectionMode selectionMode = DateRangePickerSelectionMode.range,
  // }) {
  //   return SfDateRangePicker(
  //     headerHeight: 48,
  //     initialSelectedRange: PickerDateRange(
  //       initialSelectedRange?.rangeStartDate,
  //       initialSelectedRange?.rangeEndDate,
  //     ),
  //     initialSelectedDates: initialSelectedDates,
  //     selectionMode: selectionMode,
  //     onSelectionChanged: selectDate,
  //     headerStyle: DateRangePickerHeaderStyle(textStyle: context.headline3),
  //     monthCellStyle: DateRangePickerMonthCellStyle(
  //       textStyle: context.headline5,
  //       disabledDatesTextStyle: context.headline5?.copyWith(color: Palette.neutral40),
  //       trailingDatesTextStyle: context.headline5?.copyWith(color: Palette.neutral40),
  //       leadingDatesTextStyle: context.headline5?.copyWith(color: Palette.neutral40),
  //     ),
  //     monthViewSettings: DateRangePickerMonthViewSettings(
  //       showTrailingAndLeadingDates: true,
  //       viewHeaderStyle: DateRangePickerViewHeaderStyle(
  //         textStyle: context.labelSmall?.copyWith(
  //           color: Palette.neutral40,
  //         ),
  //       ),
  //     ),
  //     rangeTextStyle: context.headline5,
  //   );
  // }
}
