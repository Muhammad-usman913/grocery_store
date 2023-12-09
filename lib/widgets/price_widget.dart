import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/text_widget.dart';

import '../services/utils.dart';
class PriceWidget extends StatefulWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color  = theme ? Colors.white : Colors.black;
    return FittedBox(
      child: Row(
        children:[
          TextWidget(
            text: '1.49\$',
            textSize: 22,
            color: Colors.green,
          ),
          SizedBox(width: 5,),
          Text('1.99\$',style: TextStyle(fontSize: 15,color: color,decoration: TextDecoration.lineThrough,),),
        ]

      ),
    );
  }
}
