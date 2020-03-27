# [导航到对应名称的 routes 里](https://flutter.cn/docs/cookbook/navigation/named-routes)

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.

    // 使用“/”命名路由来启动应用（Start the app with the "/" named route. In our case, the app will start）
    // 在这里，应用将从 FirstScreen Widget 启动（on the FirstScreen Widget）
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      // 当我们跳转到“/”时，构建 FirstScreen Widget（When we navigate to the "/" route, build the FirstScreen Widget）

      '/': (context) => FirstScreen(),

      // When navigating to the "/second" route, build the SecondScreen widget.
      // 当我们跳转到“/second”时，构建 SecondScreen Widget（When we navigate to the "/second" route, build the SecondScreen Widget）
      '/second': (context) => SecondScreen(),
    },
  ));
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Launch screen'),
          onPressed: () {
            // Navigate to the second screen using a named route.
            // 使用命名路由跳转到第二个界面（Navigate to the second screen using a named route）
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to the first screen by popping the current route
            // off the stack.
            // 通过从堆栈弹出当前路由（Navigate back to the first screen by popping the current route）
            // 来返回到第一个界面（off the stack）
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
```
