import 'package:flutter/material.dart';

class level_card extends StatelessWidget {
  const level_card({
    super.key,
    required this.levelText,
    required this.titleText,
    required this.icon,
    required this.image,
    required this.color1,
    required this.color2,
    required this.color3,
    required this.image_height,
    required this.image_width,
  });

  final String levelText;
  final String titleText;
  final IconData icon;
  final String image;
  final Color color1;
  final Color color2;
  final Color color3;
  final double image_height;
  final double image_width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(30),
            child: Container(
              padding:
                  const EdgeInsets.only(top: 10.0, bottom: 20.0, left: 20.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                      colors: [color1, color2, color3],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5.0),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white54),
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(levelText,
                      style: const TextStyle(
                          color: Color(0xE5FFE5E5),
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500)),
                  Text(titleText,
                      style: const TextStyle(
                          color: Color(0xFFFFE5E5),
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                image,
                width: image_width,
                height: image_height,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
