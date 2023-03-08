// ignore_for_file: use_build_context_synchronously, avoid_print, avoid_web_libraries_in_flutter
import 'dart:html';
import 'package:admin_dashboard/constants/constants.dart';
import 'package:admin_dashboard/controllers/logged_user_controller.dart';
import 'package:admin_dashboard/controllers/register_controller.dart';
import 'package:admin_dashboard/routing/routes.dart';
import 'package:admin_dashboard/constants/controllers.dart';
import 'package:admin_dashboard/constants/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import '../../helpers/authentication.dart';
import '../../helpers/custom_auth.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final RegisterController registerController = Get.put(RegisterController());

  final LoggedUserController loggedUserController =
      Get.put(LoggedUserController());

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode usernameFocus = FocusNode();

  bool isLoginScreen = true;
  bool isEditingEmail = false;
  bool isEditingPassword = false;
  bool isEditingUsername = false;
  bool isRegistering = false;
  bool isLoggingIn = false;
  bool passwordIsVisible = false;

  String? validateEmail(String value) {
    value = value.trim();
    if (registerController.emailController.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Email can\'t be empty';
      } else if (!value.contains(RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"))) {
        return 'Enter a correct email address';
      }
    }
    return null;
  }

  String? validatePassword(String value) {
    value = value.trim();
    if (registerController.passwordController.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Password can\'t be empty';
      } else if (value.length < 6) {
        return 'Password must be at least 6 characters';
      }
    }
    return null;
  }

  String? validateUsername(String value) {
    value = value.trim();
    if (registerController.usernameController!.text.isNotEmpty) {
      if (value.isEmpty) {
        return 'Username can\'t be empty';
      } else if (value.length < 6) {
        return 'Username must be at least 6 characters';
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset("assets/icons/logo.png"),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(isLoginScreen ? "Login" : "Create your account",
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomText(
                    text: isLoginScreen
                        ? "Welcome back to the admin panel."
                        : "Create an account to access.",
                    color: lightGray,
                  ),
                ],
              ),
              Row(
                children: [
                  CustomText(
                    text: isLoginScreen
                        ? "If you do not want to create an account "
                        : "You can use fake information",
                    color: lightGray,
                  ),
                ],
              ),
              Row(
                children: [
                  CustomText(
                    text: isLoginScreen
                        ? "you can use the next demo account: "
                        : "to test the app. The information",
                    color: lightGray,
                  ),
                ],
              ),
              Row(
                children: [
                  CustomText(
                    text: isLoginScreen
                        ? "test@email.com, 123456"
                        : "will be stored in Firebase.",
                    color: lightGray,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              !isLoginScreen
                  ? TextField(
                      focusNode: usernameFocus,
                      controller: registerController.usernameController,
                      onChanged: (value) {
                        setState(() {
                          isEditingUsername = true;
                        });
                      },
                      decoration: InputDecoration(
                          focusColor: active,
                          hoverColor: active,
                          labelText: "Username",
                          hintText: "jdoe123",
                          errorText: isEditingUsername
                              ? validateUsername(
                                  registerController.usernameController!.text)
                              : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    )
                  : const SizedBox(
                      height: 1,
                    ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                focusNode: emailFocus,
                controller: registerController.emailController,
                onChanged: (value) {
                  setState(() {
                    isEditingEmail = true;
                  });
                },
                decoration: InputDecoration(
                    focusColor: active,
                    hoverColor: active,
                    labelText: "Email",
                    hintText: "abc@domain.com",
                    errorText: isEditingEmail
                        ? validateEmail(registerController.emailController.text)
                        : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                focusNode: passwordFocus,
                controller: registerController.passwordController,
                onChanged: (value) {
                  setState(() {
                    isEditingPassword = true;
                  });
                },
                obscureText: !passwordIsVisible,
                decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            passwordIsVisible = !passwordIsVisible;
                          });
                        },
                        child: Icon(
                          passwordIsVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: lightGray,
                        ),
                      ),
                    ),
                    labelText: "Password",
                    hintText: "123456",
                    errorText: isEditingPassword
                        ? validatePassword(
                            registerController.passwordController.text)
                        : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              const SizedBox(
                height: 15,
              ),
              /*isLoginScreen
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const CustomText(
                              text: "Remeber Me",
                            ),
                          ],
                        ),
                        CustomText(text: "Forgot password?", color: active)
                      ],
                    )
                  : const SizedBox(
                      height: 1,
                    ),*/
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  if (!isLoginScreen) {
                    //if we are in the register screen

                    setState(() {
                      isRegistering = true;
                    });

                    //show snackbar if the fields are empty and stop execution
                    if (registerController.emailController.text.isEmpty ||
                        registerController.passwordController.text.isEmpty ||
                        registerController.usernameController!.text.isEmpty) {
                      var snackbar = const SnackBar(
                          width:
                              // ignore: todo
                              //TODO: for small screens 250 and 500 for large screens
                              500,
                          padding: EdgeInsets.all(10),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: Duration(seconds: 3),
                          dismissDirection: DismissDirection.horizontal,
                          closeIconColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                          content: Center(
                            child: Text(
                              "Please fill all the fields!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      setState(() {
                        isRegistering = false;
                      });
                      return;
                    }

                    //show snackbar if the fields are not valid and stop execution
                    if (validateEmail(
                                registerController.emailController.text) !=
                            null ||
                        validatePassword(
                                registerController.passwordController.text) !=
                            null ||
                        validateUsername(
                                registerController.usernameController!.text) !=
                            null) {
                      var snackbar = const SnackBar(
                          width: 500,
                          padding: EdgeInsets.all(10),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: Duration(seconds: 3),
                          dismissDirection: DismissDirection.horizontal,
                          closeIconColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                          content: Center(
                            child: Text(
                              "Please input valid data!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      setState(() {
                        isRegistering = false;
                      });
                      return;
                    }

                    try {
                      //custom auth
                      var result = await userSignup(
                        registerController.usernameController!.text,
                        registerController.emailController.text,
                        registerController.passwordController.text);

                      var msg = result['msg'];

                      //firebase auth
                      /*var result = await registerWithEmailPassword(
                          registerController.emailController.text,
                          registerController.passwordController.text);*/

                      var snackbar = SnackBar(
                          width: 500,
                          padding: const EdgeInsets.all(10),
                          behavior: SnackBarBehavior.floating,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: const Duration(seconds: 3),
                          dismissDirection: DismissDirection.horizontal,
                          closeIconColor: Colors.white,
                          backgroundColor:
                              //custom auth
                              msg != Constants.customRegisterOk
                                  //firebase auth
                                  //result != Constants.registerOk
                                  ? Colors.redAccent
                                  : Colors.green,
                          content: Center(
                            child: Text(
                              msg,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);

                      //custom auth
                      if (msg == Constants.customRegisterOk) {
                        //firebase auth
                        //if (result == Constants.registerOk) {
                        isLoginScreen = true;
                      }
                    } catch (e) {
                      var snackbar = const SnackBar(
                          width: 500,
                          padding: EdgeInsets.all(10),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: Duration(seconds: 3),
                          dismissDirection: DismissDirection.horizontal,
                          closeIconColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                          content: Center(
                            child: Text(
                              "Error, please try again later!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } finally {
                      setState(() {
                        isRegistering = false;
                      });
                    }
                  } else {
                    //if we are in the login screen

                    setState(() {
                      isLoggingIn = true;
                    });

                    //show snackbar if the fields are empty and stop execution
                    if (registerController.emailController.text.isEmpty ||
                        registerController.passwordController.text.isEmpty) {
                      var snackbar = const SnackBar(
                          width: 500,
                          padding: EdgeInsets.all(10),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: Duration(seconds: 3),
                          dismissDirection: DismissDirection.horizontal,
                          closeIconColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                          content: Center(
                            child: Text(
                              "Please fill all the fields!",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      setState(() {
                        isLoggingIn = false;
                      });
                      return;
                    }

                    try {
                      //custom auth
                      var result = await userLogin(
                        registerController.emailController.text,
                        registerController.passwordController.text);

                      var msg = result['msg'];
                      var token = result['token'];

                      //save token in a cookie
                      CookieManager().addCookie(Constants.cookieName, token);

                      //firebase auth
                      /*var result = await signInWithEmailPassword(
                          registerController.emailController.text,
                          registerController.passwordController.text);*/

                      var snackbar = SnackBar(
                          width: 500,
                          padding: const EdgeInsets.all(10),
                          behavior: SnackBarBehavior.floating,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: const Duration(seconds: 3),
                          dismissDirection: DismissDirection.horizontal,
                          closeIconColor: Colors.white,
                          backgroundColor:
                              //custom auth
                              msg != Constants.loginOk
                                  //firebase auth
                                  //result != Constants.loginOk
                                  ? Colors.redAccent
                                  : Colors.green,
                          content: Center(
                            child: Text(
                              msg,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);

                      //custom auth
                      if (msg == Constants.loginOk) {
                        //firebase auth
                        //if (result == Constants.loginOk) {
                        menuController
                        .changeActiveItemTo(overViewPageDisplayName);
                        Get.offAllNamed(rootRoute);
                      }
                    } catch (e) {
                      var snackbar = const SnackBar(
                          width: 500,
                          padding: EdgeInsets.all(10),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          duration: Duration(seconds: 3),
                          dismissDirection: DismissDirection.horizontal,
                          closeIconColor: Colors.white,
                          backgroundColor: Colors.redAccent,
                          content: Center(
                            child: Text(
                              "Error please check your credentials and try again",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ));
                      ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    } finally {
                      setState(() {
                        isLoggingIn = false;
                      });
                    }
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: active, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: isRegistering || isLoggingIn
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : CustomText(
                          text: isLoginScreen ? "Login" : "Register",
                          color: Colors.white,
                        ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: isLoginScreen
                      ? "Want to create your own account?   "
                      : "Already have an account?   ",
                ),
                TextSpan(
                    text: isLoginScreen ? "Register! " : "Log In!",
                    style: TextStyle(color: active),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          isLoginScreen = !isLoginScreen;
                        });
                      })
              ])),
              const SizedBox(
                height: 15,
              ),
              isLoginScreen
                  ? const Center(
                      child: Text(
                      "-   Or   -",
                      style: TextStyle(color: Colors.grey),
                    ))
                  : const SizedBox(
                      height: 1,
                    ),
              const SizedBox(
                height: 15,
              ),
              isLoginScreen
                  ? Center(
                      child: SignInButton(
                      Buttons.Google,
                      text: "Sign in with Google",
                      onPressed: () {
                        signInWithGoogle().then((result) {
                          if (result != null) {
                            menuController
                                .changeActiveItemTo(overViewPageDisplayName);
                            Get.offAllNamed(rootRoute);
                          }
                        }).catchError((e) {
                          var snackbar = const SnackBar(
                              width: 500,
                              padding: EdgeInsets.all(10),
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              duration: Duration(seconds: 3),
                              dismissDirection: DismissDirection.horizontal,
                              closeIconColor: Colors.white,
                              backgroundColor: Colors.redAccent,
                              content: Center(
                                child: Text(
                                  "Error, please try again later!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        });
                      },
                    ))
                  : const SizedBox(
                      height: 1,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CookieManager {
  static CookieManager manager = CookieManager.getInstance();

  static getInstance() {
    return manager;
  }

  void addCookie(String key, String value) {
    // 2592000 sec = 30 days.
    document.cookie =
        "$key=$value; max-age=2592000; path=/; SameSite=Lax; Secure";
  }

  String getCookie(String name) {
    String? cookies = document.cookie;
    List<String> listValues = cookies!.isNotEmpty ? cookies.split(";") : [];
    String matchVal = "";
    for (int i = 0; i < listValues.length; i++) {
      List<String> map = listValues[i].split("=");
      String key = map[0].trim();
      String val = map[1].trim();
      if (name == key) {
        matchVal = val;
        break;
      }
    }
    return matchVal;
  }

  void removeCookie(String name) {
    document.cookie = "$name=; max-age=0; path=/; SameSite=Lax; Secure";
  }
}
