import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_store/widgets/price_widget.dart';
import 'package:grocery_store/widgets/text_widget.dart';

import '../services/utils.dart';

class OnSaleWidget extends StatefulWidget {
  const OnSaleWidget({Key? key}) : super(key: key);

  @override
  State<OnSaleWidget> createState() => _OnSaleWidgetState();
}

class _OnSaleWidgetState extends State<OnSaleWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Utils(context).getTheme;
    Color color = theme ? Colors.white : Colors.black;
    Size size = Utils(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (){

          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Image.network(
                     'https://freepngimg.com/thumb/apricot/133548-apricot-fruit-slice-hd-image-free.png',
                     height: size.width * 0.22,
                     fit: BoxFit.fill,
                   ),
                   Column(
                     children: [
                       TextWidget(text: '1kg', color: color, textSize: 22,isTitle: true,),
                       SizedBox(height: 6,),
                       Row(
                         children: [
                           GestureDetector(
                             onTap: (){

                             },
                               child: Icon(IconlyLight.bag2,
                                 size: 22,
                                 color: color,
                               )),
                           GestureDetector(
                               onTap: (){

                               },
                               child: Icon(IconlyLight.heart ,
                                 size: 22,
                                 color: color,
                               )),
                         ],
                       ),

                     ],
                   )
               ],),
              const  PriceWidget(),
              const  SizedBox(height: 5,),
                TextWidget(text: "Product Title", color: color, textSize: 16,isTitle: true ,),
                const  SizedBox(height: 5,),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
