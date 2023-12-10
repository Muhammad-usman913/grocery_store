import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class HeartBTN extends StatelessWidget {
  const HeartBTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color = theme ? Colors.white : Colors.black;
    return GestureDetector(
        onTap: (){

        },
        child: Icon(IconlyLight.heart ,
          size: 22,
          color: color,
        ));
  }
}
