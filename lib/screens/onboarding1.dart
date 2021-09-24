import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // ignore: unused_element
  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 20.0.h,
      width: isActive ? 20.0.w : 20.0.w,
      decoration: BoxDecoration(
        color: isActive ? Colors.grey : Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: height,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    //1 page
                    Column(
                      children: <Widget>[
                        onBoardingPictures(),
                        onBoardingcolors(Color(0xff1CA85C), Color(0xffE4E4E4),
                            Color(0xffE4E4E4)),
                        onBoardingtextWidget("Send payment requests"),
                      ],
                    ),
                    //2 page
                    Container(
                      color: Color(0xff1CA85C),
                      child: Column(
                        children: <Widget>[
                          onBoardingPictures(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Color(0xffE4E4E4),
                                maxRadius: 10.sp,
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(30)),
                                child: CircleAvatar(
                                  backgroundColor: Color(0xff1CA85C),
                                  maxRadius: 10.sp,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              CircleAvatar(
                                backgroundColor: Color(0xffE4E4E4),
                                maxRadius: 10.sp,
                              ),
                            ],
                          ),
                          onBoardingtextWidget("Get paid instantly")
                        ],
                      ),
                    ),

                    //3rd page
                    Column(
                      children: <Widget>[
                        onBoardingPictures(),
                        onBoardingcolors(Color(0xffE4E4E4), Color(0xffE4E4E4),
                            Color(0xff1CA85C)),
                        onBoardingtextWidget("Track all your payments")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget onBoardingPictures() {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 42.h),
        child: Container(
          alignment: Alignment.center,
          child: Image.asset(
            "assets/images/HoneyduLogo.png",
            width: 180.0.w,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(right: 38.44.w, bottom: 40.h),
        child: Image.asset(
          "assets/images/welcome.png",
          width: 300.0.h,
        ),
      ),
    ],
  );
}

Widget onBoardingtextWidget(String title) {
  return Column(
    children: [
      Padding(
        padding:
            EdgeInsets.only(top: 50.h, bottom: 16.h, left: 20.w, right: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: headingTextStyle,
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Honeydu is the best and fastest way to\nget paid from brands. You can send an\ninvoice and get paid with no fees.",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w300,
                color: Color(0xff8D8D8D),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget onBoardingcolors(Color first, Color second, Color third) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      CircleAvatar(
        backgroundColor: first,
        maxRadius: 10.sp,
      ),
      SizedBox(
        width: 10.w,
      ),
      CircleAvatar(
        backgroundColor: second,
        maxRadius: 10.sp,
      ),
      SizedBox(
        width: 10.w,
      ),
      CircleAvatar(
        backgroundColor: third,
        maxRadius: 10.sp,
      ),
    ],
  );
}
