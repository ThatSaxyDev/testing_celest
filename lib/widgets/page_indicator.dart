import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int pageIndex;
  const PageIndicator({
    super.key,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            //! circle 1
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
            ),

            //! bar 1
            Expanded(
              child: Container(
                height: 3,
                color: Colors.grey.withOpacity(0.2),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 3,
                      width: pageIndex == 0 ? 0 : 160,
                      decoration: const BoxDecoration(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            //! circle 2
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: pageIndex == 0 ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: pageIndex == 0
                      ? Colors.grey.withOpacity(0.2)
                      : Colors.black,
                ),
              ),
            ),

            //! bar 2
            Expanded(
              child: Container(
                height: 3,
                color: Colors.grey.withOpacity(0.2),
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: 3,
                      width: pageIndex > 1 ? 160 : 0,
                      decoration: const BoxDecoration(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            //! circle 3
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: pageIndex > 1 ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: pageIndex > 1
                      ? Colors.black
                      : Colors.grey.withOpacity(0.2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
