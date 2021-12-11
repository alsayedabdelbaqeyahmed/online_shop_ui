import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_ui/constants/constant_data.dart';
import 'package:online_shop_ui/constants/constants.dart';
import 'package:online_shop_ui/constants/dialoge.dart';
import 'package:online_shop_ui/models/user.dart';
import 'package:online_shop_ui/provider/user_provider.dart';
import 'package:online_shop_ui/splash_screen/defult_buttons.dart';
import 'package:provider/provider.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final passCont = TextEditingController();
  bool rember = false;
  String userType;

  @override
  void dispose() {
    passCont.dispose();

    super.dispose();
  }

  final Map<String, dynamic> signInData = {
    'Email': '',
    'Password': '',
    'confirm Your Password': '',
    'UserName': '',
    'Address': '',
    'PhoneNumber': '',
  };
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Form(
      key: _formkey,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          emailform('Enter Your Email', 'Email', 'assets/icons/Mail.svg',
              signInData, size),
          SizedBox(height: size.height * 0.04),
          emailform('Enter Your Name', 'UserName', 'assets/icons/User.svg',
              signInData, size),
          SizedBox(height: size.height * 0.04),
          emailform('Enter Your Phone', 'PhoneNumber', 'assets/icons/User.svg',
              signInData, size),
          SizedBox(height: size.height * 0.04),
          emailform('Enter Your Address', 'Address', 'assets/icons/User.svg',
              signInData, size),
          SizedBox(height: size.height * 0.04),
          passform(
            hint: 'Enter Your Password',
            lable: 'Password',
            assets: 'assets/icons/Lock.svg',
            signInData: signInData,
            size: size,
          ),
          SizedBox(height: size.height * 0.04),
          passform(
            hint: 'Re-enter Your Password',
            lable: 'confirm Your Password',
            assets: 'assets/icons/Lock.svg',
            signInData: signInData,
            size: size,
            contr: passCont,
          ),
          SizedBox(height: size.height * 0.04),
          TextButton(
            onPressed: () async {
              AwesomeDialog(
                padding: EdgeInsets.all(size.height * 0.02),
                context: context,
                dialogType: DialogType.QUESTION,
                body: Column(children: [
                  Text(
                    'Chose the account type',
                    style: TextStyle(
                        color: Colors.black, fontSize: size.height * 0.02),
                  ),
                  Text(
                    'Are you seller or buyer',
                    style: TextStyle(
                        color: Colors.red, fontSize: size.height * 0.03),
                  ),
                ]),
                showCloseIcon: true,
                btnOkText: conbuyer,
                btnOkOnPress: () => setState(() {
                  userType = conbuyer;
                }),
                btnCancelText: conseller,
                btnCancelOnPress: () => setState(() {
                  userType = conseller;
                }),
              )..show();
            },
            child: Text(
              'chose the type',
              style: TextStyle(fontSize: size.height * 0.02),
            ),
          ),
          SizedBox(height: size.height * 0.045),
          DefultButton(
            text: 'Sign Up',
            press: () async {
              if (_formkey.currentState.validate() && userType != null) {
                _formkey.currentState.save();
                await Provider.of<UserProvider>(context, listen: false)
                    .signUpNewUser(
                  User(
                    email: signInData['Email'],
                    password: signInData['Password'],
                    userName: signInData['UserName'],
                    address: signInData['Address'],
                    phone: signInData['PhoneNumber'],
                    usertype: userType,
                  ),
                  context,
                );
              } else if (userType == null) {
                showDialogeMethod(context, 'please chose the account type');
              }
            },
          ),
        ],
      ),
    );
  }

  Widget emailform(
    String hint,
    String lable,
    String assets,
    Map<String, dynamic> signInData,
    Size size,
  ) {
    return TextFormField(
      keyboardType: lable == 'PhoneNumber' ? TextInputType.phone : null,
      decoration: InputDecoration(
        hintText: hint,
        labelText: lable,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: imageMethod(
          size,
          assets,
        ),
      ),
      onSaved: (value) {
        setState(() {
          signInData[lable] = value;
        });
      },
      validator: (value) {
        return validFunction(lable, value);
      },
    );
  }

  Widget passform({
    String hint,
    String lable,
    String assets,
    Map<String, dynamic> signInData,
    Size size,
    TextEditingController contr,
  }) {
    return TextFormField(
      obscureText: true,
      controller: contr,
      decoration: InputDecoration(
        hintText: hint,
        labelText: lable,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: imageMethod(
          size,
          assets,
        ),
      ),
      onSaved: (value) {
        setState(() {
          contr == null
              ? signInData['Password'] = value
              : signInData['confirmpass'] = value;
        });
      },
      validator: (value) {
        if (value.isEmpty) {
          return kPassNullError;
        } else if (value.length < 8) {
          return kShortPassError;
        } else if (passCont.text != null && passCont.text != value) {
          return kMatchPassError;
        }
        return null;
      },
    );
  }

  String name(String value) {
    if (value.isEmpty) {
      return kFirstNamelNullError;
    }
    return null;
  }

  String email(String value) {
    if (value.isEmpty) {
      return kEmailNullError;
    } else if (!emailValidatorRegExp.hasMatch(value)) {
      return kInvalidEmailError;
    }
    return null;
  }

  String phoneNumber(String value) {
    if (value.isEmpty) {
      return kPhoneNumberNullError;
    }
    if (value.contains(RegExp(r"^[a-zA-Z]+@[a-zA-Z]+\.[a-zA-Z]+"))) {
      return 'Invalid Phone Number';
    }
    return null;
  }

  String locInfo(String value) {
    if (value.isEmpty) {
      return kAddressNullError;
    }

    return null;
  }

  String validFunction(String lable, String value) {
    switch (lable.trim()) {
      case 'UserName':
        return name(value);
        break;
      case 'Email':
        return email(value);
        break;
      case 'PhoneNumber':
        return phoneNumber(value);
        break;

      default:
        return locInfo(value);
        break;
    }
  }
}
