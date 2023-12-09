
import 'package:flutter/material.dart';
import 'package:grocery_store/provider/dark_theme_provider.dart';
import 'package:grocery_store/widgets/text_widget.dart';
import 'package:provider/provider.dart';


class CategoriesWidget extends StatelessWidget {
   CategoriesWidget({Key? key,required this.imagePath, required this.color,required this.categoryName}) : super(key: key);

   String imagePath;
   String categoryName;
   Color color;

  @override
  Widget build(BuildContext context) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    Color color1 = darkThemeProvider.getDarkTheme ? Colors.white : Colors.black;
    return InkWell(
      onTap: (){
        print("Button is pressed");
      },
      child: Container(

        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: color.withOpacity(0.7), // Specify the color of the border
            width: 2.0,           // Specify the width of the border
          ),
        ),
        child: Column(
          children: [
            Container(
              width: _screenWidth * 0.3,
              height: _screenWidth * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.fill)
              ),
            ),
            TextWidget(text: categoryName, color: color1, textSize: 20,isTitle: true,)
          ],
        )
      ),
    );

  }
}
