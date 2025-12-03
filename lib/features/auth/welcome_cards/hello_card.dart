import 'package:flutter/material.dart';

class HelloCard extends StatelessWidget {
  const HelloCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadiusGeometry.circular(30),
        color: Colors.white,
      ),

      child: Column(
        spacing: 20,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topRight: Radius.circular(28),
              topLeft: Radius.circular(28),
            ),
            child: Image.asset(
              'lib/features/auth/welcome_cards/images/hello_card_image.png',
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Text('Hello', style: Theme.of(context).textTheme.titleMedium),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non consectetur turpis. Morbi eu eleifend lacus.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
