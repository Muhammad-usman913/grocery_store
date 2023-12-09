import 'package:flutter/material.dart';
import 'package:grocery_store/services/utils.dart';
import 'package:grocery_store/widgets/text_widget.dart';

import '../model/category_model.dart';
import '../widgets/categories_widget.dart';


class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  // List<Color> gridColors = [
  //   const Color(0xff53B175),
  //   const ,
  //   const ,
  //   const,
  //   const ,
  //   const ,
  // ];

  List<CartegoryModel> categoryList = [
    CartegoryModel(categoryName: 'Fruit', cellColor: Color(0xff53B175), imageUrl: 'assets/images/cat/fruits.png'),
    CartegoryModel(categoryName: 'Vegetables', cellColor: Color(0xffF8A44C), imageUrl: 'assets/images/cat/veg.png'),
    CartegoryModel(categoryName: 'Herbs', cellColor: Color(0xffF7A593), imageUrl: 'assets/images/cat/Spinach.png'),
    CartegoryModel(categoryName: 'Nuts', cellColor:  Color(0xffD3B0E0), imageUrl: 'assets/images/cat/nuts.png'),
    CartegoryModel(categoryName: 'Spices', cellColor: Color(0xffFDE598), imageUrl: 'assets/images/cat/spices.png'),
    CartegoryModel(categoryName: 'Grains', cellColor: Color(0xffB7DFF5), imageUrl: 'assets/images/cat/grains.png'),
  ];

  // final List<Color> cellColors = [
  //   Colors.red,
  //   Colors.blue,
  //   Colors.green,
  //   Colors.yellow,
  //   Colors.orange,
  //   Colors.purple,
  //   Colors.teal,
  //   Colors.pink,
  //   Colors.indigo,
  //   Colors.cyan,
  // ];
  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(text: 'Category Screen',color: color,textSize: 22,isTitle: true,),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            childAspectRatio: 240/250,
            crossAxisSpacing: 10.0,
            children: List.generate(6, (index) => CategoriesWidget(
              imagePath: categoryList[index].imageUrl!,
              categoryName: categoryList[index].categoryName!,
              color: categoryList[index].cellColor!,
            )),

        ),
      ),
    );
  }
}

// Card(
// child: ClipRRect(
// borderRadius: BorderRadius.circular(8.0), // Set your desired border radius
// child: Container(
// child: Center(
// child: Column(
// children: [
// Image.asset(categoryList[index].imageUrl!,width: 100,height: 100,),
// Text(categoryList[index].categoryName!),
// ],
// ),
// ),
// ),
// ),
// );
