import 'package:flutter/material.dart';

class OnBoardingCard extends StatelessWidget {
  final String image, title, description, buttonText;
  final Function onPressed;
  const OnBoardingCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var orientation = MediaQuery.of(context).orientation;

    return Container(
      height: orientation == Orientation.portrait ? size.height * 0.80 : size.height * 0.60,
      width: size.width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              height: orientation == Orientation.portrait ? size.height * 0.4 : size.height * 0.3,
            ),
          ),
          Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: orientation == Orientation.portrait ? 25 : 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: orientation == Orientation.portrait ? 15 : 12,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            ],
          ),
          MaterialButton(
            minWidth: size.width * 0.8,
            height: size.height * 0.06,
            onPressed: () => onPressed(),
            color: const Color(0xff1aa260),
            child: Text(
              buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18
              ),
            ),
          )
        ],
      ),
    );
  }
}
