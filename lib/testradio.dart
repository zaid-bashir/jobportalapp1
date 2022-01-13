// ignore_for_file: unused_field, use_key_in_widget_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormFieldState> _specifyTextFieldKey = GlobalKey<FormFieldState>();
  final List<CustumRadioButtons> items = [
      CustumRadioButtons(value: 1,text: "Male"),
      CustumRadioButtons(value: 2,text: "Female"),
      CustumRadioButtons(value: 3,text: "Others"),
  ];
  int radioId = 0;
  String radioValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FormBuilder Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              FormBuilder(
                key: _fbKey,
                child: Column(
                  children: [
                     TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),
              TextFormField(),
                    FormBuilderRadioGroup<CustumRadioButtons>(
                      name: "Gender",
                      onChanged: (val){
                        radioId = val.value;
                        radioValue = val.text;
                        print(radioId);
                        print(radioValue);
                      },
                      validator : (val){
                        if(val == null){
                          return "This field is required";
                        }else{
                          return null;
                        }
                      },
                      initialValue: null,
                      options:   items
                              .map((lang) => FormBuilderFieldOption(
                                    value: lang,
                                    child: Text(lang.text),
                                  ))
                              .toList(growable: false),
                    ),
                  ],
                ),
              ),
              MaterialButton(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_fbKey.currentState.saveAndValidate()) {
                        } else {
                          print("validation failed");
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustumRadioButtons{
  int value;
  String text;
  CustumRadioButtons({this.value,this.text});
}