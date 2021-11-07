import 'package:apna_khana/constants/colors/app_colors.dart';
import 'package:apna_khana/utils/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
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
                colorFilter: ColorFilter.mode(Colors.amberAccent.withOpacity(0.05), BlendMode.dstATop),
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
                            'Signup',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Create account',
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
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: AppColors.white,
                              prefixIcon: Icon(
                                CupertinoIcons.profile_circled,
                                color: Colors.grey[600],
                              ),
                              hintText: "Name",
                              isDense: true,
                            ),
                            keyboardType: TextInputType.name,
                          ),
                          SizedBox(height: 20.0),
                          TextField(
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
                          TextField(
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
                          SizedBox(height: 20.0),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(AppRoutes.home);
                              },
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text("Sign In"),
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
                          SizedBox(height: 10.0),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account?"),
                                Text(" "),
                                InkWell(
                                  onTap: (){
                                    Navigator.of(context).pushNamed(AppRoutes.login);
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
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
}
