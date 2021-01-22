import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPageValue = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: pageController,
                itemCount: onbordingList.length,
                onPageChanged: (page){
                  getChangedPageAndMoveBar(page);
                },
                itemBuilder: (context, index){
                  return onbordingList[index];
                }
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 59,
                    right: 16
                ),
                child: Text('건너뛰기',
                  style: TextStyle(
                      color: Color(0xFF9AA6B0)
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)
                  )
                ),
                child: Column(children: <Widget>[
                  Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: <Widget>[
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (int i = 0; i < onbordingList.length; i++)
                              if (i == currentPageValue) ...[circleBar(true)] else
                                circleBar(false),
                          ],
                        ),
                        height: 52,
                      ),
                    ],
                  ),
                  Text('옷 세탁법이 궁금하세요?'),
                  Text('카메라 버튼을 눌러 라벨을 찍어보세요'),
                  RaisedButton(
                    child: Text('다음'),
                    onPressed: () {
                      if(currentPageValue <2){
                        print('$currentPageValue');
                        getChangedPageAndMoveBar(currentPageValue+1);
                        pageController.jumpToPage(currentPageValue);
                      }
                    },
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  final List<Widget> onbordingList = <Widget>[
    Container(
      alignment: Alignment.topCenter,
      child: Image.asset('images/3.png'),
    ),
    Container(
      alignment: Alignment.topCenter,
      child: Image.asset('images/1.png'),
    ),
    Container(
      alignment: Alignment.topCenter,
      child: Image.asset('images/2.png'),
    )
  ];

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Color(0xFFF8D247) : Colors.white,
          border: Border.all(
            color : isActive ? Color(0xFFDFB10F) : Color(0xFFC4C4C4),
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  final List<List<String>> prompt = [
    ['옷 세탁법이 궁금하세요?','카메라 버튼을 눌러 라벨을 찍어보세요'],
    ['찍힌 라벨이\n맞는지 확인해주세요','산클에서 라벨 이미지를 분석하여\n세탁법과 상세 정보를 알려준답니다!'],
    ['보관함에 라벨을\n저장할 수 있어요','이전에 찍었던 라벨 정보를 다시 확인할 수 있어요']
  ];

  void getChangedPageAndMoveBar(int page) {
    setState(() {
      currentPageValue = page;
    });
  }
}

