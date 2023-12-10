
import 'package:flutter/material.dart';
import 'package:grocery_store/widgets/text_widget.dart';

import '../services/utils.dart';
class PriceWidget extends StatelessWidget {
   PriceWidget({Key? key,required this.isOnsale,required this.price,required this.salePrice,required this.textPrice}) : super(key: key);

  final double salePrice,price;
  final String textPrice;
  final bool isOnsale;

  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color  = theme ? Colors.white : Colors.black;
    double userPrice = isOnsale ? salePrice : price;
    return FittedBox(
      child: Row(
        children:[
          TextWidget(
            text: '\$${(userPrice*int.parse(textPrice)).toStringAsFixed(2)}',
            textSize: 22,
            color: Colors.green,
          ),
          SizedBox(width: 5,),
          Visibility(
              visible: isOnsale ? true : false,
              child: Text('\$${(price*int.parse(textPrice)).toStringAsFixed(2)}',style: TextStyle(fontSize: 15,color: color,decoration: TextDecoration.lineThrough,),)),
        ]

      ),
    );
  }
}
