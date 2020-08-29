import 'package:Smeg/Screens/homeScreens/home/home.dart';
import 'package:Smeg/Screens/start/start.dart';
import 'package:Smeg/app_components/notifications.dart';
import 'package:flutter/material.dart';
import 'package:Smeg/Screens/menu/get_menu.dart';
import 'package:Smeg/app_components/main_body.dart';
import 'package:Smeg/constants.dart';
import 'package:Smeg/ins/lang.dart';
import 'package:Smeg/ins/net.dart';
import 'package:Smeg/ins/ui/ins_ui.dart';
import 'package:Smeg/ins/utils.dart';
import 'package:Smeg/models/cart.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

class CheckoutScreen extends StatefulWidget {
  static String id = "checkout";
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return AddMenuScreen(
      title: INSLang.get("inquiries"),
      Screen: AppBody(
        child: CheckOutBody(),
      ),
    );
  }
}

class CheckOutBody extends StatefulWidget {
  const CheckOutBody({
    Key key,
  }) : super(key: key);

  @override
  _CheckOutBodyState createState() => _CheckOutBodyState();
}

class _CheckOutBodyState extends State<CheckOutBody> {
  String _email = "", _name = "", _address = "";
  final _fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inNotification(onDone: () {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.only(top: 16, left: 16),
              width: double.infinity,
              child: RichText(
                text: TextSpan(
                    style: TextStyle(
                        fontSize: 16, height: 1.5, color: Colors.grey),
                    children: [
                      Cart.gettotalNumber() > 0
                          ? TextSpan(
                              text: INSLang.get("number"),
                            )
                          : TextSpan(text: ""),
                      Cart.gettotalNumber() > 0
                          ? TextSpan(
                              text: Cart.gettotalNumber().toString() + "\n")
                          : TextSpan(text: ""),
                      Cart.gettotalPrice() > 0
                          ? TextSpan(text: INSLang.get("total"))
                          : TextSpan(text: ""),
                      Cart.gettotalPrice() > 0
                          ? TextSpan(
                              text: Cart.gettotalPrice().toString() + "\n")
                          : TextSpan(text: ""),
                    ]),
              ),
            ),
          ),
          Form(
            key: _fromKey,
            child: Column(
              children: [
                InputCont(
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: INSLang.get("name"),
                      border: OutlineInputBorder(),
                    ),
                    validator: _validate,
                    onSaved: (input) => _name = input,
                  ),
                ),
                InputCont(
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: INSLang.get("email"),
                      border: OutlineInputBorder(),
                    ),
                    validator: _validate,
                    onSaved: (input) => _email = input,
                  ),
                ),
                InputCont(
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLength: null,
                    maxLines: 5,
                    decoration: InputDecoration(
                      labelText: INSLang.get("address"),
                      border: OutlineInputBorder(),
                    ),
                    validator: _validate,
                    onSaved: (input) => _address = input,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16.0),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          onPressed: _whats,
                          child: Text(INSLang.get('sendtowa')),
                        ),
                        RaisedButton(
                          onPressed: _submit,
                          child: Text(INSLang.get('submit')),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  var _dec = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(5)),
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1))
    ],
  );
  Container InputCont(Widget child) {
    return Container(
        margin: EdgeInsets.all(INSDefultpadding / 4),
        padding: EdgeInsets.all(0),
        decoration: _dec,
        child: child);
  }

  String _validate(value) {
    if (value.isEmpty) {
      return INSLang.get('entertext');
    } else {
      return null;
    }
  }

//https://api.whatsapp.com/send?phone=201222489051&text=Hi

  void _whats() {
    var obj = {};

    if (_fromKey.currentState.validate()) {
      _fromKey.currentState.save();
      INSUtils.getDeviceId(context, onDone: (id) {
        obj["email"] = _email;
        obj["name"] = _name;
        obj["items"] = Cart.getDataJsone();
        obj["device_id"] = id;
        obj["address"] = _address;

        String msg = "email  : " + _email + "\n";
        msg += "name  : " + _name + "\n";
        msg += "address  : " + _address + "\n";
        msg += "device_id  : " + id + "\n";

        msg += "items  : " + Cart.getDataJsone() + "\n";

        FlutterOpenWhatsapp.sendSingleMessage(phonenumber, msg);
        INSUI.successSnack(context, INSLang.get("successfullymsg"));

        showNotification(
            title: INSLang.get("messagefromSmeg"),
            body: INSLang.get("successfullymsg"));

        Future.delayed(const Duration(seconds: 2), () {
          Cart.clear();
          Navigator.pushNamed(context, StartScreen.id);
        });
      });
    }
  }

  void _submit() {
    var obj = {};

    if (_fromKey.currentState.validate()) {
      _fromKey.currentState.save();
      INSUtils.getDeviceId(context, onDone: (id) {
        obj["email"] = _email;
        obj["name"] = _name;
        obj["items"] = Cart.getDataJsone();
        obj["device_id"] = id;
        obj["address"] = _address;

        INSNet.getJsone(
            addToUrl: "insert/com_orders/",
            data: obj,
            onDone: (data) {
              if (data != false) {
                INSUI.successSnack(context, INSLang.get("successfullymsg"));

                showNotification(
                    title: INSLang.get("messagefromSmeg"),
                    body: INSLang.get("successfullymsg"));

                Future.delayed(const Duration(seconds: 2), () {
                  Cart.clear();
                  Navigator.pushNamed(context, StartScreen.id);
                });
              } else {
                INSUI.errorSnack(context, INSLang.get("faildmsg"));
              }
            });
      });
    }
  }
}
