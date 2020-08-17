import 'package:flutter/material.dart';
import 'package:shop_app/Screens/menu/get_menu.dart';
import 'package:shop_app/app_components/main_body.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/ins/net.dart';
import 'package:shop_app/ins/ui/ins_ui.dart';
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
      title: "Checkout",
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
    return SizedBox(
      height: double.infinity,
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
                      TextSpan(
                        text: "Number : ",
                      ),
                      TextSpan(text: Cart.gettotalNumber() + "\n"),
                      TextSpan(text: "TOTAL :   "),
                      TextSpan(text: Cart.gettotalPrice() + "\n"),
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
                      labelText: "Name *",
                      border: OutlineInputBorder(),
                    ),
                    validator: _validate,
                    onSaved: (input) => _name = input,
                  ),
                ),
                InputCont(
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email *",
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
                      labelText: "Address *",
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
                          child: Text('Send To WhatsAPP'),
                        ),
                        RaisedButton(
                          onPressed: _submit,
                          child: Text('Submit'),
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
      return 'Please enter some text';
    } else {
      return null;
    }
  }

  void _submit() {
    var obj = {};

    var k = _fromKey.currentState.validate();
    if (_fromKey.currentState.validate()) {
      _fromKey.currentState.save();
      obj["email"] = _email;
      obj["name"] = _name;
      obj["items"] = Cart.getDataJsone();

      INSNet.getJsone(
          addToUrl: "insert/com_orders/",
          data: obj,
          onDone: (data) {
            if (data != false) {
              INSUI.successSnack(
                  context, "Your order has been sent successfly");
            } else {
              INSUI.errorSnack(
                  context, "Your order sent faild,Something want wrong!");
            }
          });
    }
  }
}
