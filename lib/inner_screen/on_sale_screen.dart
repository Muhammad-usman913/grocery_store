import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_store/widgets/text_widget.dart';

import '../services/utils.dart';
import '../widgets/on_sale_widget.dart';

class OnSaleScreen extends StatelessWidget {
   OnSaleScreen({Key? key}) : super(key: key);

   static const routeName = "/OnSaleScreen";

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.getTheme ? Colors.white : Colors.black;
    Size size = utils.size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(IconlyLight.arrowLeft2,color: color,),
        ),
        title: TextWidget(text: "Product on sale",textSize: 24,color: color,isTitle: true,),),
      body:  GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.zero,
        mainAxisSpacing: 10.0,
        childAspectRatio: size.width/(size.height*0.45),
        crossAxisSpacing: 10.0,
        children: List.generate(6, (index) => OnSaleWidget()),

      ),
    );
  }
}
