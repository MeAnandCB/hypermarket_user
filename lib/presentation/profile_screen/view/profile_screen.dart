import 'package:flutter/material.dart';
import 'package:hypermarket_user/core/constants/color.dart';
import 'package:hypermarket_user/presentation/login_screen/view/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool chanhePass = false;
  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
    // Navigate back to login screen

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }

  late SharedPreferences _prefs;

  String _password = '';

  @override
  void initState() {
    super.initState();
    loadSharedPreferencesAndData();
  }

  Future<void> loadSharedPreferencesAndData() async {
    _prefs = await SharedPreferences.getInstance();

    _password = _prefs.getString('password') ?? '';

    setState(() {}); // Update the UI with the retrieved data
  }

  var _oldpass = TextEditingController();
  var _newpass = TextEditingController();
  var _confpass = TextEditingController();

  var oldKey = GlobalKey<FormState>();
  var newwKey = GlobalKey<FormState>();
  var confKey = GlobalKey<FormState>();
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getString("password");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              InkWell(
                onTap: () {
                  chanhePass = !chanhePass;
                  setState(() {});
                },
                child: chanhePass == false
                    ? Hero(
                        tag: 'valuecheck',
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                          child: Row(
                            children: [
                              Icon(Icons.password),
                              SizedBox(width: 20),
                              Text("Change Password")
                            ],
                          ),
                        ),
                      )
                    : Hero(
                        tag: 'valuecheck',
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all()),
                          child: Column(
                            children: [
                              Text("Change Password"),
                              SizedBox(height: 15),
                              Form(
                                key: oldKey,
                                child: TextFormField(
                                  controller: _oldpass,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Old password"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Something';
                                    } else if (value != _password) {
                                      return "Please Enter a valid password";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 15),
                              Form(
                                key: newwKey,
                                child: TextFormField(
                                  controller: _newpass,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "New password"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Something';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 15),
                              Form(
                                key: confKey,
                                child: TextFormField(
                                  controller: _confpass,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: "Confirm password"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please Enter Something';
                                    } else if (value != _newpass.text) {
                                      return "Please Enter a valid password";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 15),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        chanhePass = !chanhePass;
                                        setState(() {});
                                        _oldpass.clear();
                                        _newpass.clear();
                                        _confpass.clear();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color:
                                                    ColorConstant.hyperGrey)),
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Cancel",
                                            style: TextStyle(
                                                color: ColorConstant.mainBlack),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        if (oldKey.currentState!.validate() &&
                                            newwKey.currentState!.validate() &&
                                            confKey.currentState!.validate()) {
                                          print("Old pass : $_password");
                                          print("New  pass : ${_newpass.text}");
                                          print(
                                              "COnfm pass : ${_confpass.text}");
                                        }
                                        chanhePass = !chanhePass;
                                        setState(() {});
                                        _oldpass.clear();
                                        _newpass.clear();
                                        _confpass.clear();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: ColorConstant.primaryGreen),
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                                color: ColorConstant.mainWhite),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: _logout,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: Row(
                    children: [
                      Icon(Icons.logout),
                      SizedBox(width: 20),
                      Text("LogOut")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
