import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBarr extends StatefulWidget {
  const CustomAppBarr({Key? key, required this.percent, required this.images})
      : super(key: key);
  final double percent;
  final List<String> images;
  @override
  State<CustomAppBarr> createState() => _CustomAppBarrState();
}

class _CustomAppBarrState extends State<CustomAppBarr> {
  int _currentIndex = 0;

  void changeIndex(int i) => setState(() => _currentIndex = i);
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      margin: EdgeInsets.only(top: topPadding),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))),
      child: Stack(
        children: [
          //! basic Appbar
          PageView.builder(
            controller: PageController(
                viewportFraction: .9, initialPage: _currentIndex),
            itemCount: widget.images.length,
            onPageChanged: (value) => setState(() => _currentIndex = value),
            itemBuilder: (context, index) {
              final bool _isSelected = _currentIndex == index;
              return AnimatedContainer(
                duration: kThemeAnimationDuration,
                margin: EdgeInsets.only(
                  right: 10,
                  top: _isSelected ? 5 : 30,
                  bottom: _isSelected ? 5 : 30,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: NetworkImage(widget.images[index]),
                      fit: BoxFit.cover),
                ),
              );
            },
          ),
          Positioned(
            top: 10,
            left: 10,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.grey[400]),
                  child: const Icon(CupertinoIcons.back)),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.grey[400]),
                child: const Icon(CupertinoIcons.heart)),
          ),
        ],
      ),
    );
  }
}
