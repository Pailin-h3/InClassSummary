import 'package:ProtectMyPocket_app/models/logIn_model.dart';
import 'package:ProtectMyPocket_app/pages/Sign-up.dart';
import 'package:ProtectMyPocket_app/pages/add_category.dart';
import 'package:ProtectMyPocket_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final TextStyle whiteText = TextStyle(
    color: Colors.white,
  );
  final TextStyle greyText = TextStyle(
    color: Colors.grey.shade700,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
                FlatButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(title: 'Sign Up'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 5.0,
          // ),
          Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/facebook4.png'),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Consumer<RegisterFormModel>(
                        builder: (context, form, child) {
                          String name = form.email;
                          return Text(
                            "$name",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                      child: Consumer<RegisterFormModel>(
                        builder: (context, form, child) {
                          String country = form.country;
                          return Text(
                            "$country",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.grey.shade400,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          SingleChildScrollView(
            child: Card(
              child: ListTile(
                title: Text(
                  "Languages",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "English US",
                  style: greyText,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey.shade700,
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Profile Settings",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Miss Donut",
                style: greyText,
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade700,
              ),
              onTap: () {},
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Category Setting",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Set income expense",
                style: greyText,
              ),
              trailing: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.grey.shade700,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCategory(),
                    ));
              },
            ),
          ),
          Card(
            child: SwitchListTile(
              title: Text(
                "Email Notification",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "On",
                style: greyText,
              ),
              value: true,
              onChanged: (val) {},
            ),
          ),
          Card(
            child: SwitchListTile(
              title: Text(
                "Push Notification",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Off",
                style: greyText,
              ),
              value: false,
              onChanged: (val) {},
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}

// _showAlertDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Center(child: Text('Category Setting')),
//         content: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 FlatButton(
//                   onPressed: () {
//                     //context,
//                   },
//                   color: Colors.green,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text('Income', textAlign: TextAlign.center),
//                   ),
//                 ),
//                 FlatButton(
//                   onPressed: () {
//                     //context
//                   },
//                   color: Colors.red,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Text('Expense', textAlign: TextAlign.center),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               width: 300,
//               height: 300,
//               child: Expanded(
//                 flex: 2,
//                 child: ListView.builder(
//                   itemCount: expenselist.length,
//                   itemBuilder: (context, index) {
//                     bool checked = false;
//                     return Padding(
//                       padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
//                       child: Row(
//                         children: [
//                           Checkbox(
//                             // toggleable: true,
//                             value: checked,
//                             // groupValue: null,
//                             onChanged: null,
//                           ),
//                           Text(
//                             '    ${expenselist[index]}',
//                             textAlign: TextAlign.left,
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//             Row(
//               children: [
//                 Icon(Icons.add),
//                 Text("Add More"),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           RaisedButton(
//             child: Text('OK'),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//           RaisedButton(
//             child: Text('Cancle'),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
