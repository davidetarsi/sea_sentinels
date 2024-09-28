import 'package:flutter/material.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:intl/intl.dart';

class SurveyTextField extends StatelessWidget {
  SurveyTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.datePicker = false,
      this.isNumber = false});

  final String label;
  final TextEditingController controller;
  final bool datePicker;
  final bool isNumber;
  DateTime? selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        TextFormField(
          onTap: () {
            if (datePicker) {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.dark(
                        primary: kYellow, // header background color
                        onPrimary: kDarkBlue, // header text color
                        surface: kDarkBlue,
                        onSurface: kBlueGrey, // body text color
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: kYellow, // button text color
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              ).then((pickedDate) {
                if (pickedDate == null) {
                  return;
                } else {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (context, child) {
                      return _hourFormatBuilder(
                        context,
                        Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: const ColorScheme.dark(
                              primary: kYellow, // header background color
                              onPrimary: kDarkBlue, // header text color
                              surface: kDarkBlue,
                              onSurface: kBlueGrey, // body text color
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: kYellow, // button text color
                              ),
                            ),
                          ),
                          child: child!,
                        ),
                      );
                    },
                  ).then((pickedTime) {
                    if (pickedTime == null) {
                      return;
                    } else {
                      DateTime selectedDteTime = DateTime(
                        pickedDate.year,
                        pickedDate.month,
                        pickedDate.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                      controller.text = dateFormat.format(selectedDteTime);
                    }
                  });
                }
              });
            }
          },
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          controller: controller,
          cursorColor: kYellow,
          style: const TextStyle(color: kBlueGrey),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 14),
            floatingLabelStyle: const TextStyle(color: kYellow),
            //hintStyle: const TextStyle(color: kYellow),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kYellow),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            errorStyle: const TextStyle(color: kYellow),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kYellow),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          validator: (value) {
            if (isNumber) {
              if (value == null ||
                  value.isEmpty ||
                  int.tryParse(value) == null ||
                  int.tryParse(value)! < 0) {
                return 'The quantity should be a valid number (0 or greater).';
              }
            } else {
              if (value == null ||
                  value.isEmpty ||
                  value.trim().length < 2 ||
                  value.trim().length > 50) {
                if (datePicker) {
                  return 'Please select a date.';
                } else {
                  return 'Names must be between 2 and 50 characters long.';
                }
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}

Widget _hourFormatBuilder(BuildContext context, Widget? child) {
  final mediaQueryData = MediaQuery.of(context);

  return MediaQuery(
    data: mediaQueryData.alwaysUse24HourFormat
        ? mediaQueryData
        : mediaQueryData.copyWith(alwaysUse24HourFormat: true),
    child: child!,
  );
}
