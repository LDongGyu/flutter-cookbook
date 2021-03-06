import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPageValue = 0;
  final pageController = PageController();
  SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadIsGuided();
  }

  void _loadIsGuided() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            pageView(),
            bottomView()
          ],
        ),
      ),
    );
  }

  final List<Widget> onbordingList = <Widget>[
    FittedBox(
      alignment: Alignment.topCenter,
      child: Image.asset('assets/images/3.png'),
      fit: BoxFit.fill
    ),
    FittedBox(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/1.png'),
        fit: BoxFit.fill
    ),
    FittedBox(
        alignment: Alignment.topCenter,
        child: Image.asset('assets/images/2.png'),
        fit: BoxFit.fill
    ),
  ];

  Widget pageView(){
    return Expanded(
      flex: 6,
      child: Stack(
        children: <Widget>[
          Container(
            // width: MediaQuery.of(context).size.width,
            child: PageView.builder(
                controller: pageController,
                itemCount: onbordingList.length,
                onPageChanged: (page) {
                  getChangedPageAndMoveBar(page);
                },
                itemBuilder: (context, index) {
                  return onbordingList[index];
                }),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 59, right: 16),
              child: TouchableOpacity(
                activeOpacity: 0.6,
                onTap: () {
                  _prefs.setBool('isGuided', true);
                },
                child: Text(
                  '건너뛰기',
                  style: TextStyle(color: Color.fromRGBO(15, 16, 18, 1)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomView(){
    return Expanded(
      flex: 4,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
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
                        if (i == currentPageValue) ...[
                          circleBar(true)
                        ] else
                          circleBar(false),
                    ],
                  ),
                  height: 52,
                ),
              ],
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        onbordingList2[currentPageValue],
                        SizedBox(height: 16.0),
                        Text('${prompt[currentPageValue][1]}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'nanum_square',
                                fontWeight: FontWeight.w300))
                      ]),
                )),
            Expanded(child: Container()),
            TouchableOpacity(
              activeOpacity: 0.6,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  FlatButton(
                    height: 52,
                    child: Wrap(
                      // alignment: Alignment.centerLeft,
                      // padding: EdgeInsets.only(left: 15),
                        children: [
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(width: 16),
                            Text(
                              '${prompt[currentPageValue][2]}',
                              style: TextStyle(
                                fontFamily: 'nanum_square',
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              child: SvgPicture.asset(
                                'assets/images/shape.svg',
                                height: 16,
                              ),
                            ),
                            SizedBox(width: 16),
                          ])
                        ]),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromRGBO(15, 16, 18, 0.4),
                            width: 0.5),
                        borderRadius: BorderRadius.circular(30.0)),
                    onPressed: () {
                      if (currentPageValue < 2) {
                        print('$currentPageValue');
                        getChangedPageAndMoveBar(currentPageValue + 1);
                        pageController.jumpToPage(currentPageValue);
                      }
                      if (currentPageValue == 2) {
                        _prefs.setBool('isGuided', true);
                      }
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            )
          ]),
        ),
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: isActive ? Color(0xFFF8D247) : Colors.white,
          border: Border.all(
            color: isActive ? Color(0xFFDFB10F) : Color(0xFFC4C4C4),
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
    );
  }

  final List<List<String>> prompt = [
    ['옷 세탁법이 궁금하세요?', '카메라 버튼을 눌러 라벨을 찍어보세요', '다음'],
    ['찍힌 라벨이\n맞는지 확인해주세요', '산클에서 라벨 이미지를 분석하여\n세탁법과 상세 정보를 알려준답니다!', '다음'],
    ['보관함에 라벨을\n저장할 수 있어요', '이전에 찍었던 라벨 정보를 다시 확인할 수 있어요', '시작하기']
  ];

  final List<Widget> onbordingList2 = <Widget>[
    Text.rich(TextSpan(
        text: '옷 세탁법',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'nanum_square'),
        children: <TextSpan>[
          TextSpan(
            text: '이 궁금하세요?',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                fontFamily: 'nanum_square'),
          )
        ])),
    Text.rich(TextSpan(
        text: '찍힌 라벨',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'nanum_square'),
        children: <TextSpan>[
          TextSpan(
            text: '이\n맞는지 확인해주세요',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                fontFamily: 'nanum_square'),
          )
        ])),
    Text.rich(TextSpan(
        text: '보관함에 라벨을\n',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w300,
            fontFamily: 'nanum_square'),
        children: <TextSpan>[
          TextSpan(
            text: '저장',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
                fontFamily: 'nanum_square'),
          ),
          TextSpan(
            text: '할 수 있어요',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
                fontFamily: 'nanum_square'),
          )
        ])),
  ];

  void getChangedPageAndMoveBar(int page) {
    setState(() {
      currentPageValue = page;
    });
  }
}
