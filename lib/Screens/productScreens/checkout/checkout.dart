import 'package:flutter/material.dart';
import 'package:shop_app/Screens/menu/get_menu.dart';
import 'package:shop_app/app_components/main_body.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/lang.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/ins/ui/ins_ui.dart';
import 'package:shop_app/ins/utils.dart';
import 'package:shop_app/models/cart.dart';

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
  Widget build(BuildContext context) {
    return Expanded(
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
                      labelText:INSLang.get("email"),
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
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RaisedButton(
                          onPressed: () {
                            INSNet.getJsone(
                                data: {"mydata": "data"},
                                onDone: (data) {
                                  print(data);
                                });

                            if (_fromKey.currentState.validate()) {
                              _fromKey.currentState.save();
                            }
                          },
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

  void _submit() {
    var obj = {};

    var k = _fromKey.currentState.validate();
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
                INSUI.successSnack(
                    context, INSLang.get("successfullymsg"));
              } else {
                INSUI.errorSnack(
                    context, INSLang.get("faildmsg"));
              }
            });
      });
    }
  }
}
