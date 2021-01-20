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
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                color: Colors.white,
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
