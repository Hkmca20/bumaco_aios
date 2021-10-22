import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EmptyContentWidget extends StatelessWidget {
  const EmptyContentWidget({
    Key? key,
    this.icon = Icons.not_accessible_rounded,
    this.message = 'Empty Content',
  }) : super(key: key);
  final IconData icon;
  final String message;
  @override
  Widget build(BuildContext context) {
    return VxShimmer(
      child: VStack(
        [
          Icon(
            icon,
            size: 150,
          ),
          message.text.size(30).make().centered(),
        ],
        alignment: MainAxisAlignment.center,
        crossAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
