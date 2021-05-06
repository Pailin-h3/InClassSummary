import 'package:ProtectMyPocket_app/controller/todo.dart';
import 'package:ProtectMyPocket_app/models/profile_model.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  final AccountController controller;

  AccountPage({Key key, @required this.controller}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<Account> accounts;
  bool isLoading = false;

  void initState() {
    super.initState();
    widget.controller.onSync.listen(
      (bool syncState) => setState(() {
        isLoading = syncState;
      }),
    );
  }

  void _getAccounts() async {
    var newAccounts = await widget.controller.fetchAccounts();
    setState(() => accounts = newAccounts);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: accounts != null ? accounts.length : 1,
          itemBuilder: (context, index) {
            if (accounts != null) {
              return Text('${accounts[index].email}');
            } else {
              return Text("Tap to fetch accounts");
            }
          },
        );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _getAccounts(),
        child: Icon(Icons.add),
      ),
    );
  }
}
