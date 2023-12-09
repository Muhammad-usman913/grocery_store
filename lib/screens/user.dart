import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_store/provider/dark_theme_provider.dart';
import 'package:grocery_store/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DarkThemeProvider darkThemeProvider = Provider.of<DarkThemeProvider>(context);
    final Color color = darkThemeProvider.getDarkTheme ? Colors.white : Colors.black;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Hi,',
                          style: _boldTextStyle(Colors.lightBlue),
                        ),
                        Text(
                          "My name",
                          style: _boldTextStyle(color),
                        )
                      ],
                    ),
                    TextWidget(text: 'test@test.com', color: color, textSize: 18)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Divider(
                thickness: 1,
              ),
              SizedBox(height: 20,),
              _buildListTile(
                iconLeading: IconlyLight.profile,
                title: "Address",
                subtitle: "My address 2",
                color: color,
                onTap: () async{
                 await _showAddressDialog();
                },
              ),
              _buildListTile(
                iconLeading: IconlyLight.bag,
                title: "Order",
                color: color,
                onTap: () {
                  // Add navigation logic for this ListTile
                },
              ),
              _buildListTile(
                iconLeading: IconlyLight.heart,
                title: "Wishlist",
                color: color,
                onTap: () {
                  // Add navigation logic for this ListTile
                },
              ),
              _buildListTile(
                iconLeading: IconlyLight.show,
                title: "Viewed",
                color: color,
                onTap: () {
                  // Add navigation logic for this ListTile
                },
              ),
              _buildListTile(
                iconLeading: IconlyLight.unlock,
                title: "Forget Password",
                color: color,
                onTap: () {
                  // Add navigation logic for this ListTile
                },
              ),
              SwitchListTile(
                title: TextWidget(text: darkThemeProvider.getDarkTheme ? "Dark Theme" : "Light Theme",textSize: 22,color: color,),
                secondary: Icon(
                    darkThemeProvider.getDarkTheme ? Icons.dark_mode_outlined : Icons
                        .light_mode_outlined),
                onChanged: (bool value) {
                  darkThemeProvider.setDarkTheme(value);
                },
                value: darkThemeProvider.getDarkTheme,
              ),
              _buildListTile(
                iconLeading: IconlyLight.logout,
                title: "Logout",
                color: color,
                onTap: () async{
                await _showLogoutDialog(color);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _boldTextStyle(Color color) {
    return TextStyle(
      color: color,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
  }

  ListTile _buildListTile({
   required IconData? iconLeading,
   required String? title,
    String? subtitle,
    required Function()? onTap,
    required Color color
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(iconLeading),
      title: TextWidget(
        text: title!,
        color: color,
        textSize: 22,
      ),
      subtitle: TextWidget(
        text: subtitle ?? "",
        color: color,
        textSize: 18,
      ),
      trailing: Icon(IconlyLight.arrowRight2), // Provide a default icon or handle null
    );
  }

  Future<void> _showAddressDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update'),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                 controller : _addressController,
                  decoration: InputDecoration(
                    hintText: "Your Address",
                  ),
                  maxLines: 5,
                  onChanged: (value){
                    print("address controller : ${_addressController.text}");
                  },
                )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Update'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showLogoutDialog(Color color) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              Image.asset('assets/images/warning-sign.png',width: 20,height: 20,),
              SizedBox(width: 8,),
              Text("Sign out")
            ],
          ),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextWidget(text: "Do you wana Sign out?", color: color, textSize: 18)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel',style: TextStyle(color: Colors.cyan),),
              onPressed: () {
                if(Navigator.canPop(context)){
                  Navigator.of(context).pop();
                }

              },
            ),
            TextButton(
              child: const Text('Ok',style: TextStyle(color: Colors.red),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}
