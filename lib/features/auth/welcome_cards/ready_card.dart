import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReadyCard extends StatelessWidget {
  const ReadyCard({super.key});

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
              'lib/features/auth/welcome_cards/images/ready_card_image.png',
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24, vertical: 18),
            child: Column(
              spacing: 8,
              children: [
                Text('Ready?', style: Theme.of(context).textTheme.titleMedium),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                FilledButton(
                  onPressed: () {
                    context.go('/');
                  },
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                    textStyle: Theme.of(context).textTheme.labelLarge,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  child: const Text("Let's Start"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
