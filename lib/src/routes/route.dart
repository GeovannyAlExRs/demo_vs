import 'package:flutter/material.dart';

import '../pages/alert_page.dart';
import '../pages/animated_container.dart';
import '../pages/avatar_page.dart';
import '../pages/card_page.dart';
import '../pages/home_page.dart';
import '../pages/input_page.dart';
import '../pages/slider_page.dart';

Map<String, WidgetBuilder> getApplicationRoute() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
    'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
    'input': (BuildContext context) => InputPage(),
    'slider': (BuildContext context) => SliderPage(),
  };
}
