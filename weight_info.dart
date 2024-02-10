import 'package:flutter/material.dart';

class WeightInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2A2929),
      body: Container(
        width: 430.0,
        height: 932.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.only(left: 15.0, top: 45.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    Container(
                      width: 90.0,
                      height: 45.0,
                      child: Image.asset('assets/buttonback.png'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
                  Text(
                    "What's your",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'current weight?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildInnerShadowContainer('weight'),
                ],
              ),
            ),
            Container(
              width: 412.0,
              height: 52.0,
              margin: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF2ADF88), // Top color
                    Color(0xFF628F79), // Bottom color
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: _buildNextButton(),
            ),
            Container(
              width: 412.0,
              height: 276.0,
              margin: EdgeInsets.symmetric(horizontal: 9.0),
              color: Color(0xFFADADAD),
              child: _buildRectangles(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return Container(
      width: 345.0,
      height: 52.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: LinearGradient(
          colors: [
            Color(0xFF2ADF88), // Top color
            Color(0xFF628F79), // Bottom color
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: Text(
          'Next',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Jost',
          ),
        ),
      ),
    );
  }

  Widget _buildInnerShadowContainer(String text) {
    return Container(
      width: 215.0,
      height: 41.0,
      margin: EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(1),
            spreadRadius: -1,
            blurRadius: 0,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Color(0xFF2ADF88),
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            fontFamily: 'Jost',
          ),
        ),
      ),
    );
  }

  Widget _buildRectangles() {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFADADAD),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            4,
            (rowIndex) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                3,
                (colIndex) {
                  final number = (rowIndex * 3) + colIndex + 1;
                  double buttonWidth = 120.0;
                  double buttonHeight = 50.0;
                  if (number == 10) {
                    return _buildButton('.', buttonWidth, buttonHeight);
                  } else if (number == 11) {
                    return _buildButton('0', buttonWidth, buttonHeight);
                  } else if (number == 12) {
                    return _buildButtonDelete(buttonWidth, buttonHeight);
                  } else {
                    return _buildButton('$number', buttonWidth, buttonHeight);
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'Jost',
          ),
        ),
      ),
    );
  }

  Widget _buildButtonDelete(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          'assets/deletebutton.png',
          width: 42.0,
          height: 25.0,
        ),
      ),
    );
  }
}
