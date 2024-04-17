import 'dart:async';

import 'package:flutter/material.dart';

class AdsWidget extends StatefulWidget {
  final List<String> publicacoes;

  const AdsWidget({super.key, required this.publicacoes});

  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> {
  final _pageController = PageController();
  Timer? _timer;
   int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.page == widget.publicacoes.length - 1) {
        _pageController.animateToPage(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.publicacoes.length,
            itemBuilder: (BuildContext context, int index) {
              return Image.network(
                widget.publicacoes[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.publicacoes.length,
            (index) => Container(
              margin: const EdgeInsets.all(4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? Theme.of(context).colorScheme.onBackground : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}