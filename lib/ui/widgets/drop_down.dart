import 'package:flutter/material.dart';

class CDropDown extends StatelessWidget {
  final List<String> dropDownItems;
  final dynamic dropDownValue;
  final void Function(dynamic) onChanged;
  const CDropDown(
      {Key? key,
        required this.dropDownItems,
        required this.onChanged,
        required this.dropDownValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
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
