import 'package:flutter/material.dart';

class Navigator2 extends StatefulWidget {
  @override
  _Navigator2State createState() => _Navigator2State();
}

class _Navigator2State extends State<Navigator2> {
  bool showPage2 = false;
  bool showPage3 = false;
  bool page2First = true;
  bool middle = false;
  MaterialPageRoute materialPageRoute;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(child: Page1(
          onPress: () {
            setState(() {
              showPage2 = true;
            });
          },
        )),
        if (showPage2)
          MaterialPage(
              name: 'page2',
              child: Page2(
                onPress: () {
                  setState(() {
                    showPage3 = true;
                  });
                },
              )),
        if (middle)
          MaterialPage(
              child: Center(
            child: Text('中间页'),
          )),
        if (showPage3)
          MaterialPage(
              key: Key('p333'),
              name: 'page3',
              child: Page3(
                // key: Key('333'),
                onPress: () {
                  setState(() {
                    showPage2 = false;
                    showPage3 = false;
                  });
                },
                addMiddle: () {
                  setState(() {
                    middle = true;
                  });
                },
              )),
      ],
      onPopPage: (Route route, result) {
        print('route:$route, result:$result');
        if (!route.didPop(result)) {
          return false;
        }

        return true;
      },
    );
  }
}

class Page1 extends StatelessWidget {
  final VoidCallback onPress;

  const Page1({Key key, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            onPressed: () {
              onPress?.call();
            },
            child: Text('页面1')),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final VoidCallback onPress;

  const Page2({Key key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            onPressed: () => onPress?.call(), child: Text('页面2,点击去页面3')),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  final VoidCallback onPress;
  final VoidCallback addMiddle;
  const Page3({Key key, this.onPress, this.addMiddle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            RaisedButton(
                onPressed: () => onPress?.call(), child: Text('页面3,返回首页')),
            RaisedButton(
                onPressed: () => addMiddle?.call(), child: Text('添加中间页')),
          ],
        ),
      ),
    );
  }
}
