import 'package:fisika_mobile_app/app/constans.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: kBlue,
          borderRadius: BorderRadius.circular(14.0),
          // boxShadow: [
          //   BoxShadow(
          //     color: Color(0x29000000),
          //     blurRadius: 12,
          //   ),
          // ],
        ),
        child: Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          alignment: Alignment.bottomCenter,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
