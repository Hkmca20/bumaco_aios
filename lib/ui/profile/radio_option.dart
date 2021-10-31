import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyRadioOption<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String label;
  final IconData icon;
  final String text;
  final ValueChanged<T?> onChanged;

  const MyRadioOption({
    required this.value,
    required this.groupValue,
    required this.icon,
    this.label = '',
    required this.text,
    required this.onChanged,
  });

  Widget _buildLabel() {
    final bool isSelected = value == groupValue;

    return Container(
      width: 30,
      height: 30,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: BorderSide(
            color: kPrimaryLightColor,
          ),
        ),
        color: isSelected ? kPrimaryColor : kGreyLightColor,
      ),
      child: Center(child: Icon(icon, color: kWhiteColor)
          // Text(
          //   value.toString(),
          //   style: TextStyle(
          //     color: isSelected ? Colors.white : Colors.cyan,
          //     fontSize: 20,
          //   ),
          // ),
          ),
    );
  }

  Widget _buildText() {
    return text.text.make();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => onChanged(value),
        splashColor: kTransparentColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              _buildLabel(),
              const SizedBox(width: 10),
              _buildText(),
            ],
          ),
        ),
      ),
    );
  }
}
