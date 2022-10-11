import 'package:cgpa_app/util/text_styles.dart';
import 'package:flutter/material.dart';

class CDropDown extends StatelessWidget {
  final List<String> dropDownItems;
  final String? hint;
  final dynamic dropDownValue;
  final void Function(dynamic) onChanged;
  const CDropDown(
      {Key? key,
        this.hint,
        required this.dropDownItems,
        required this.onChanged,
        required this.dropDownValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      style: MyStyles.style1.copyWith(color: Colors.black),
      hint: Text(hint??'', style: MyStyles.style1.copyWith(color: Colors.black),),

      alignment: Alignment.center,
      items: List.generate(
          dropDownItems.length,
              (index) => DropdownMenuItem(
              value: dropDownItems[index],

              child: Text(dropDownItems[index])
          )),
      onChanged: onChanged,
      value: dropDownValue,
    );
  }
}
