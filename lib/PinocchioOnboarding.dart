import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: PageView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset('images/3.png'),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset('images/2.png'),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset('images/1.png'),
                  )
                ],
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
                  Text('옷 세탁법이 궁금하세요?'),
                  Text('카메라 버튼을 눌러 라벨을 찍어보세요'),
                  RaisedButton(
                    child: Text('다음'),
                    onPressed: () {},
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//
// PageView(
// children: <Widget>[
// Container(
// alignment: Alignment.topCenter,
// child: Image.asset('images/1.png'),
// ),
// Container(
// alignment: Alignment.topCenter,
// child: Image.asset('images/2.png'),
// ),
// Container(
// alignment: Alignment.topCenter,
// child: Image.asset('images/3.png'),
// )
// ],
// ),
