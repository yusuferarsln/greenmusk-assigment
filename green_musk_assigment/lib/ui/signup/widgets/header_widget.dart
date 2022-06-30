import 'package:flutter/material.dart';
import 'package:green_musk_assigment/ui/signup/constants/colors.dart';

class headerWidget extends StatelessWidget {
  const headerWidget({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Build Your',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: headOne,
                  )),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Profile',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.w700, color: headTwo),
              ),
            ),
          ],
        ),
        Container(
            height: height * 0.17,
            width: width * 0.17,
            child: Image.asset("images/cube.png")),
      ],
    );
  }
}
