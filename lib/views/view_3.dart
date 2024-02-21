import 'package:flutter/material.dart';
import 'package:testing_celest/views/view_2.dart';
import 'package:testing_celest/views/view_4.dart';
import 'package:testing_celest/widgets/page_indicator.dart';

class View3 extends StatefulWidget {
  const View3({super.key});

  @override
  State<View3> createState() => _View3State();
}

class _View3State extends State<View3> {
  final PageController pageController = PageController();

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step ${pageIndex + 1}'),
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () => switch (pageIndex) {
            0 => goBack(context),
            1 => pageController.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              ),
            _ => pageController.previousPage(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
              ),
          },
          child: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(327, 60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PageIndicator(pageIndex: pageIndex),
          ),
        ),
      ),

      body: SizedBox(
        height: height(context),
        width: width(context),
        child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          children: List.generate(
            3,
            (index) => Center(
              child: Text('Some stuff about step ${pageIndex + 1}'),
            ),
          ),
        ),
      ),

      //!
      bottomNavigationBar: Material(
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Colors.grey.withOpacity(0.2)),
            ),
          ),
          height: 90,
          width: width(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  if (pageIndex == 2) {
                    goTo(context: context, view: const View2());
                  }
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(pageIndex == 2 ? 'Continue' : 'Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double height(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double width(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
