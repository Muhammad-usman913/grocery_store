import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_store/widgets/price_widget.dart';
import 'package:grocery_store/widgets/text_widget.dart';

import '../services/utils.dart';
import 'heart_btn.dart';

class FeedWidget extends StatefulWidget {
  const FeedWidget({Key? key}) : super(key: key);

  @override
  State<FeedWidget> createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final _quantityController = TextEditingController();
  @override
  void initState() {
    _quantityController.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.getTheme ? Colors.white : Colors.black;
    Size size = utils.size;

    return Padding(
      padding: const EdgeInsets.all(8.0), // Adjusted padding
      child: Material(
        color: Theme.of(context).cardColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: FancyShimmerImage(
                  imageUrl:
                      'https://freepngimg.com/thumb/apricot/133548-apricot-fruit-slice-hd-image-free.png',
                  height: size.width * 0.21,
                  width: size.width * 0.2,
                  boxFit: BoxFit.fill,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Cucumbers", // Adjusted product name
                      color: color,
                      textSize: 18, // Adjusted text size
                      isTitle: true,
                    ),
                    HeartBTN(),
                  ],
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 6,
                        child: PriceWidget(
                            isOnsale: true,
                            price: 5.9,
                            salePrice: 2.9,
                            textPrice: _quantityController.text),
                      ),
                      Spacer(),
                      Text('KG'),
                      SizedBox(
                        width: 5,
                      ),
                      Flexible(
                        flex: 2,
                          child: TextFormField(
                        textAlign: TextAlign.center,
                        controller: _quantityController,
                        key: ValueKey('10'),
                        style: TextStyle(color: color, fontSize: 18),
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        enabled: true,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp('[0-9.]'))
                        ],
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              _quantityController.text = '1';
                            } else {
                              // total = usedPrice *
                              //     int.parse(_quantityTextController.text);
                            }
                          });
                        },
                        onSaved: (value) {},
                      )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: TextWidget(
                    text: "Add to Cart",
                    color: color,
                    textSize: 20,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).cardColor),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12))))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
