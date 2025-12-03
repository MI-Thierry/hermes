import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'welcome_cards/hello_card.dart';
import 'welcome_cards/ready_card.dart';

class WelcomeCardsPage extends StatefulWidget {
  const WelcomeCardsPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WelcomeCardsPageState();
  }
}

class _WelcomeCardsPageState extends State<WelcomeCardsPage> {
  var _currentIndex = 0;
  final _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/welcome_cards_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Color.fromARGB(30, 0, 0, 0),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 600,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  enlargeFactor: 0.2,
                  onPageChanged: (idx, reason) {
                    setState(() {
                      _currentIndex = idx;
                    });
                  },
                ),
                carouselController: _controller,
                items: List.generate(6, (idx) => idx).map((item) {
                  return item == 5 ? ReadyCard() : HelloCard();
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(6, (idx) => idx).map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry),
                    child: Container(
                      width: 16.0,
                      height: 16.0,
                      margin: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 4.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == entry
                            ? Theme.of(
                                context,
                              ).colorScheme.primary.withAlpha(200)
                            : Theme.of(
                                context,
                              ).colorScheme.primary.withAlpha(50),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
