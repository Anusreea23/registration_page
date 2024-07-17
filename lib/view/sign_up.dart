import 'package:flutter/material.dart';
import 'package:registration_page/view/sign_in.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  static const email = "anu@123";
  static const password = "12345678";

  @override
  Widget build(BuildContext context) {
    final emailformkey = GlobalKey<FormState>();
    final passwordformkey = GlobalKey<FormState>();
    final confirmpasswordformkey = GlobalKey<FormState>();

    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController confirmpasswordcontroller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Sign Up  for Free",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Form(
                        key: emailformkey,
                        child: TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                              labelText: "your Email Address",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value != null && value.contains("@")) {
                              return null;
                            } else {
                              return "enter a valid email";
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: passwordformkey,
                        child: TextFormField(
                          controller: passwordcontroller,
                          decoration: InputDecoration(
                              labelText: "your password",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter a password";
                            }
                            if (value.length < 7) {
                              return "password must be atleast 7 characters long";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        key: confirmpasswordformkey,
                        child: TextFormField(
                          controller: confirmpasswordcontroller,
                          decoration: InputDecoration(
                              labelText: "your Confirm password",
                              labelStyle: TextStyle(
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              suffixIcon: Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )),
                          obscureText: true,
                          validator: (value) {
                            if (value == null ||
                                value != passwordcontroller.text) {
                              return "password does not match";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.blue),
                            ),
                            onPressed: () {
                              if (emailformkey.currentState!.validate() &&
                                  passwordformkey.currentState!
                                      .validate()) if (emailcontroller
                                          .text ==
                                      email &&
                                  passwordcontroller.text == password) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignIn()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        margin: EdgeInsets.all(10),
                                        duration: Duration(seconds: 2),
                                        action: SnackBarAction(
                                            label: "retry", onPressed: () {}),
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.red,
                                        content: Text("failed to login")));
                              }
                            },
                            child: Center(
                              child: Text(
                                "Sign up",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't you have an account? "),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      "sign in",
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
