import 'dart:convert';

import 'package:apna_khana/constants/colors/app_colors.dart';
import 'package:apna_khana/utils/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = false;
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger;
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    checkIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    scaffoldMessenger = ScaffoldMessenger.of(context);
    
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: BoxDecoration(
              color: Colors.amberAccent,
              image: DecorationImage(
                image: AssetImage("assets/images/food_background.png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.amberAccent.withOpacity(0.05), BlendMode.dstATop),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 80.0,
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Container(
                      child: Column(
                        children: [
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Access account',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                              prefixIcon: Icon(
                                Icons.phone_android,
                                color: Colors.grey[600],
                              ),
                              hintText: "Mobile",
                              isDense: true,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey[600],
                              ),
                              hintText: "Password",
                              isDense: true,
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(height: 40.0),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                //Navigator.of(context).pushNamed(AppRoutes.home);
                                setState(() {
                                  _isLoading = true;
                                });
                                signIn(usernameController.text, passwordController.text);
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: _isLoading ?  SizedBox(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 1,
                                  ),
                                  height: 20.0,
                                  width: 20.0,
                                ) : Text("Sign In"),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.primaryColor,
                                onPrimary: Colors.black,
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Don't have an account?"),
                                Text(" "),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRoutes.signup);
                                  },
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    color: Colors.amberAccent,
                                  ),
                                ),
                                Text("    OR    "),
                                Expanded(
                                  child: Divider(
                                    color: Colors.amberAccent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(),
                              onPressed: () {
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                        "assets/images/social_google.png"),
                                    Text("  "),
                                    Text('Login with Google')
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkIsLoggedIn() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") != null){
      Navigator.of(context).pushNamed(AppRoutes.home);
    }else{
      Navigator.of(context).pushNamed(AppRoutes.login);
    }
  }

  signIn(String email, String password) async {
    Map data = {"email_or_mobile": email, "password": password, "country_code": "+91"};
    print(data);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http.post(
        Uri.parse("http://192.168.43.21/projects/indiaNIC/laravel-reserv-lumen-api/public/api/v1/oauth/login"),
        headers: {
          "Timezone": "Asia/Kolkata",
        },
        body: data
    );
    Map<String,dynamic> responseData = jsonDecode(response.body);
    setState(() {
      _isLoading = false;
    });
    if (response.statusCode == 200) {
      //responseData = json.decode(response.body);
      setState(() {
        _isLoading = false;
        scaffoldMessenger.showSnackBar(SnackBar(content: Text("Login successful")));
        sharedPreferences.setString("token", responseData['extra_meta']['token']);
        sharedPreferences.commit();
        Navigator.of(context).pushNamed(AppRoutes.home);
      });
    }else{
      _isLoading = false;
      scaffoldMessenger.showSnackBar(SnackBar(content: Text(responseData['error']['message'])));
    }
  }
}
