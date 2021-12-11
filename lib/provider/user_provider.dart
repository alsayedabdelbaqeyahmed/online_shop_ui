import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:online_shop_ui/complete_profile/otp_screen.dart';
import 'package:online_shop_ui/constants/constant_data.dart';
import 'package:online_shop_ui/constants/dialoge.dart';
import 'package:online_shop_ui/db_helper.dart/user_Db.dart';
import 'package:online_shop_ui/home/home_screen.dart';
import 'package:online_shop_ui/log_in_sucess/log_in_sucess.dart';
import 'package:online_shop_ui/models/user.dart';
import 'package:http/http.dart';

// راجع الاجنده علي شان تعرف الي فاضل يتعمل
class UserProvider with ChangeNotifier {
  String _objectId;
  String _sessionToken;
  DateTime _expireDate;
  String _accountType;

  DateTime get expireDate => _expireDate;
  String get sessionToken {
    if (_expireDate != null &&
        _expireDate.isAfter(DateTime.now()) &&
        _sessionToken != null) {
      return _sessionToken;
    }
    return null;
  }

  bool get isAuth {
    return sessionToken != null; // mean return true if session != null
  }

  String get objectId => _objectId;

  String get accountType => _accountType;

  Future signUpNewUser(User userdata, BuildContext context) async {
    try {
      final responce = await post(
        'https://parseapi.back4app.com/users',
        headers: {
          'X-Parse-Application-Id': '7Z4VmA2zxuZ47t56ZgFLF0bqpXsE4wfLLPBbxVad',
          'X-Parse-REST-API-Key': 'MsFJnrVh6i6hu4Jclo0hrpKC0BV0C7lW2MD4x6CB',
          'X-Parse-Revocable-Session': '$_sessionToken',
          'Content-Type': 'application/json',
        },
        body: json.encode(
          userdata.toJason(),
        ),
      );

      final responceData = jsonDecode(responce.body);

      if (responceData['error'] != null) {
        var errorMessage = '';
        if (responceData['code'].toString().contains('203')) {
          errorMessage = 'The Email address is already excist';
        } else if (responceData['code'].toString().contains('202')) {
          errorMessage = 'The User name is already excist';
        } else if (responceData['code'].toString().contains('201')) {
          errorMessage = 'The Password is required';
        } else if (responceData['code'].toString().contains('200')) {
          errorMessage = 'The User name is Required';
        } else if (responceData['code'].toString().contains('204')) {
          errorMessage = 'The Email address is required';
        }

        showDialogeMethod(context, errorMessage);
      } else {
        notifyListeners();

        _objectId = responceData['objectId'];
        _sessionToken = responceData['sessionToken'];

        // print(responceData);
        await getuserInfo();
        Navigator.of(context).pushNamed(OtpScreen.routeNames);
        await getSessionInfo();
        await UserDB.insertDataBase(
          DbModel(
            date: _expireDate.toIso8601String(),
            objectId: _objectId,
            session: _sessionToken,
          ),
        );
      }
    } catch (e) {
      showDialogeMethod(context, 'An Error occured please try again later');
      throw (e);
    }
  }

  Future<void> logInNewUser(User userdata, BuildContext context) async {
    try {
      final responce = await get(
        'https://parseapi.back4app.com/login?email=${userdata.email}&password=${userdata.password}',
        headers: {
          'X-Parse-Application-Id': '7Z4VmA2zxuZ47t56ZgFLF0bqpXsE4wfLLPBbxVad',
          'X-Parse-REST-API-Key': 'MsFJnrVh6i6hu4Jclo0hrpKC0BV0C7lW2MD4x6CB',
          'X-Parse-Revocable-Session': '$_sessionToken',
        },
      );

      final responceData = jsonDecode(responce.body);

      if (responceData['error'] != null) {
        var errorMessage = '';
        if (responceData['code'].toString().contains('101')) {
          errorMessage = 'Invalid username/password';
        } else if (responceData['code'].toString().contains('205')) {
          errorMessage = 'The email is not verified ';
        }

        showDialogeMethod(context, errorMessage);
      } else {
        _objectId = responceData['objectId'];
        _sessionToken = responceData['sessionToken'];
        _accountType = responceData[conusertype];
        await getuserInfo();
        Navigator.of(context).pushNamed(LogInucess.routeNamed);
        notifyListeners();
        await getSessionInfo();

        await UserDB.insertDataBase(
          DbModel(
            date: _expireDate.toIso8601String(),
            objectId: _objectId,
            session: _sessionToken,
          ),
        );

        //  print(errorMessage);
      }
    } catch (e) {
      showDialogeMethod(context, 'An Error occured please try again later');
      throw (e);
    }
  }

// this method used to get the expiredate to use to enable the auto login
  Future<void> getSessionInfo() async {
    try {
      final data = await get(
        'https://parseapi.back4app.com/sessions',
        headers: {
          'X-Parse-Application-Id': '7Z4VmA2zxuZ47t56ZgFLF0bqpXsE4wfLLPBbxVad',
          'X-Parse-REST-API-Key': 'MsFJnrVh6i6hu4Jclo0hrpKC0BV0C7lW2MD4x6CB',
          'X-Parse-Session-Token': '$_sessionToken',
          // 'Content-Type': 'application/json'
        },
      );

      final recivedData = json.decode(data.body);
      if (recivedData == null) {
        return;
      }
      List data2 = recivedData['results'];

      Map<String, dynamic> map =
          data2.last; // get the last session wich mean the current session

      _expireDate = DateTime.tryParse(
        (map['expiresAt']['iso']),
      );
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getuserInfo() async {
    try {
      final data = await get(
        'https://parseapi.back4app.com/users',
        headers: {
          'X-Parse-Application-Id': '7Z4VmA2zxuZ47t56ZgFLF0bqpXsE4wfLLPBbxVad',
          'X-Parse-REST-API-Key': 'MsFJnrVh6i6hu4Jclo0hrpKC0BV0C7lW2MD4x6CB',
          'X-Parse-Session-Token': '$_sessionToken',
          // 'Content-Type': 'application/json'
        },
      );

      final recivedData = json.decode(data.body);
      if (recivedData == null) {
        return;
      }

      List data2 = recivedData['results'];
      final userData =
          data2.lastWhere((element) => element['objectId'] == _objectId);
      // print(userData);
      // print(userData[conusertype]);
      _accountType = userData[conusertype];
      print(_accountType);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

// the method used to try aut log in directly

  Future<bool> autoAuthentication() async {
    var listOfData = [];

    await UserDB.callDataBase().then((value) => listOfData = value);

    if (listOfData.isEmpty) {
      return false;
    }

    final expireDates = DateTime.parse(listOfData.last['$conexpireDate']);

    if (expireDates.isBefore(DateTime.now())) {
      return false;
    }

    _sessionToken = listOfData.last['$consessionToken'];
    _objectId = listOfData.last['$conobjectId'];
    _expireDate = expireDates;
    return true;
  }

  Future logOut() async {
    await UserDB.deleteDataBase();
    _sessionToken = null;
    _expireDate = null;
    _objectId = null;
    await autoAuthentication();
    notifyListeners();
  }

  Future updatUserData(User newData, BuildContext context) async {
    print('object');
    try {
      final data = await put(
        'https://parseapi.back4app.com/users/$_objectId',
        headers: {
          'X-Parse-Application-Id': '7Z4VmA2zxuZ47t56ZgFLF0bqpXsE4wfLLPBbxVad',
          'X-Parse-REST-API-Key': 'MsFJnrVh6i6hu4Jclo0hrpKC0BV0C7lW2MD4x6CB',
          'X-Parse-Session-Token': '$_sessionToken',
          'Content-Type': 'application/json'
        },
        body: json.encode(
          newData.toJason(),
        ),
      );
      print(data.body);
      if (data.statusCode != 200) {
        showDialogeMethod(context, 'An Error occured try again later');
      }
      Navigator.of(context).pushNamed(HomeScreen.routNames);
    } catch (e) {
      print(e);
    }
  }
}
