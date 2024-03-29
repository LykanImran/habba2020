import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:habba20/models/user_model.dart';
import 'package:habba20/utils/style_guide.dart';
import 'package:habba20/widgets/failure_card.dart';
import 'package:habba20/widgets/loading.dart';
import 'package:habba20/widgets/success_card.dart';
import 'package:selection_menu/components_configurations.dart';
import 'package:selection_menu/selection_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habba20/data/data.dart';
import 'package:habba20/pages/home_page.dart';
import 'package:habba20/services/google_sigin_in.dart';
import 'package:habba20/services/mysql_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class VolunteerSignUp extends StatefulWidget {
  @override
  _VolunteerSignUpState createState() => _VolunteerSignUpState();
}

class _VolunteerSignUpState extends State<VolunteerSignUp> {
  var _user = UserModel();
  List<String> collegeBranchList = ['Choose your Branch'];
  TextEditingController _nameController,
      _phoneNumberController,
      _whatsappNumberController,
      _auidController,
      _mailController;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  bool checked = false;
  int state = 0;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: name);
    _phoneNumberController = TextEditingController();
    _whatsappNumberController = TextEditingController();
    _auidController = TextEditingController();
    _mailController = TextEditingController(text: email);
  }

  Future _registerUser() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      _user.Type = 0;
      if (_user.Work == '' ||
          //_image == null ||
          _user.College == '' ||
          _user.Branch == '' ||
          _user.Year == '') {
        Fluttertoast.showToast(
            msg: "Fill the complete form",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);
        return;
      }

      setState(() {
        state = 1;
      });
      // print('Name : ${this._user.Name} Phone : ${_user.PhoneNumber}');
      var documentReference =
          Firestore.instance.collection('users').document(this._user.Id);

      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          this._user.getMap(),
        );
      });
      post_vol(_user);
      /*  documentReference.snapshots().listen((DocumentSnapshot event) {
        // here you could e.g. check if the transaction on your reference was succesful
      });
*/
      setState(() {
        state = 2;
      });

      // Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage()));// MyHomePage(title:'Event lists')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: notWhite,
        //backgroundColor: Colors.deepPurple,
        // backgroundColor: Colors.white30,
        //backgroundColor: Colors.grey[50],
        //backgroundColor: Color(0xFF8185E2).withOpacity(50),
        body: SingleChildScrollView(child: getView()));
  }

  Widget getView() {
    switch (state) {
      case 0:
        {
          return form();
        }
      case 1:
        {
          return Container(
              padding: const EdgeInsets.fromLTRB(0, 80.0, 0, 0),
              child: Center(
                child: Loading(),
              ));
        }
      case 2:
        {
          return Container(
              padding: const EdgeInsets.fromLTRB(0, 80.0, 0, 0),
              child: Center(
                child: SuccessCard(
                  title: "Volunteer Registration Successful",
                ),
              ));
        }
      case 3:
        {
          return Center(
            child: FailureCard(),
          );
        }
    }
  }

  Widget form() {
    return Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AvatarGlow(
                  endRadius: 90,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.deepOrange,
                  repeat: true,
                  repeatPauseDuration: Duration(milliseconds: 15),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: Image.asset("assets/xpaw.png"),
                        radius: 50.0,
                      )),
                ),
                Text(
                  "Habba 2020",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Column(children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Name',
                        hintText: 'Enter Your Name',
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter Your Name';
                        } else if (value.length > 31) {
                          return 'Name should be less than 30 words';
                        }

                        return null;
                      },
                      onSaved: (val) {
                        this._user.Name = val.toUpperCase().trim();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _auidController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        prefixIcon: Icon(Icons.security),
                        labelText: 'Auid',
                        hintText: 'AIT18BEIS109',
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter Your Auid';
                        } else if (value.length != 12 && value.length != 8) {
                          return 'Auid length is invalid';
                        } else if (!((value.contains('ai') ||
                            value.contains("AI")))) {
                          return "Invalid format";
                        } else if (!(value.contains(new RegExp(r'[0-9]'), 5) ||
                            value.contains(new RegExp(r'[0-9]'), 6))) {
                          return "invalid format";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        this._user.Id = val.toUpperCase().trim();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _mailController,
                      enabled: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Email',
                        hintText: 'Enter Your Email',
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Enter Your Email';
                        } else if (value.contains("@acharya.ac.in")) {
                          //this._user.Type=1;

                        } else {
                          //this._user.Type=2;
                          return "Only @acharya ID are allowed";
                        }

                        return null;
                      },
                      onSaved: (val) {
                        this._user.Mail = val;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _whatsappNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Whatsapp Number',
                          hintText: 'Enter Your Phone Number'),
                      validator: (val) {
                        if (_whatsappNumberController.text.isEmpty) {
                          return '';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        this._user.WhatsApp = val.toUpperCase();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Alternate Number',
                          hintText: 'Enter Your Phone Number'),
                      validator: (val) {
                        if (_phoneNumberController.text.isEmpty) {
                          return null;
                        }
                        return null;
                      },
                      onSaved: (val) {
                        this._user.PhoneNumber = val.toUpperCase();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1.5,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "College",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    collegeSelector(),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Department",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    departmentSelector(),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Year",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    yearSelector(),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Area of Interest",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    volunteerWorkSelector(),
                    Divider(
                      thickness: 1.5,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RaisedButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                      elevation: 25,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      //color: AppTheme.primaryBtnColor,
                      color: Colors.deepPurple,
                      onPressed: () {
                        // continueTap();
                        _registerUser();
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                )
              ]),
        ));
  }

  Widget collegeSelector() {
    return SelectionMenu<String>(
      menuSizeConfiguration: MenuSizeConfiguration(
        maxHeightFraction: 0.75,
        // maxWidthFraction, minWidthFraction, minHeightFraction are similar.
        maxWidthFraction: 0.8,
        minWidthFraction: 0.8,
        minHeightFraction: 0.45,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
      ),
      showSelectedItemAsTrigger: true,
      initiallySelectedItemIndex: 0,
      itemsList: collegeList,
      onItemSelected: (String selectedItem) {
        this._user.College = selectedItem;
        collegeBranchList = mapToList(branchMap(), selectedItem);
        //widget.user.Institution = selectedItem;
      },
      itemBuilder:
          (BuildContext context, String item, OnItemTapped onItemTapped) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            //color: AppTheme.primaryBtnColor,
            color: Colors.deepOrange,
            onPressed: () {
              onItemTapped();
              setState(() {});
              //_registerUser();
            },
            child: Text(
              '${item}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Widget departmentSelector() {
    return SelectionMenu<String>(
      menuSizeConfiguration: MenuSizeConfiguration(
        maxHeightFraction: 0.75,
        // maxWidthFraction, minWidthFraction, minHeightFraction are similar.
        maxWidthFraction: 0.8,
        minWidthFraction: 0.8,
        minHeightFraction: 0.65,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
      ),
      showSelectedItemAsTrigger: true,
      initiallySelectedItemIndex: 0,
      itemsList: collegeBranchList,
      onItemSelected: (String selectedItem) {
        this._user.Branch = selectedItem;
      },
      itemBuilder:
          (BuildContext context, String item, OnItemTapped onItemTapped) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            //color: AppTheme.primaryBtnColor,
            color: Colors.deepOrange,
            onPressed: () {
              onItemTapped();
              //_registerUser();
            },
            child: Text(
              '${item}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  Widget yearSelector() {
    return SelectionMenu<String>(
      menuSizeConfiguration: MenuSizeConfiguration(
        maxHeightFraction: 0.75,
        // maxWidthFraction, minWidthFraction, minHeightFraction are similar.
        maxWidthFraction: 0.8,
        minWidthFraction: 0.8,
        minHeightFraction: 0.45,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
      ),
      showSelectedItemAsTrigger: true,
      initiallySelectedItemIndex: 0,
      itemsList: yearList,
      onItemSelected: (String selectedItem) {
        this._user.Year = selectedItem;
      },
      itemBuilder:
          (BuildContext context, String item, OnItemTapped onItemTapped) {
        return RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          //color: AppTheme.primaryBtnColor,
          color: Colors.deepOrange,
          onPressed: () {
            onItemTapped();
            //_registerUser();
          },
          child: Text(
            '${item}',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  Widget volunteerWorkSelector() {
    return SelectionMenu<String>(
      menuSizeConfiguration: MenuSizeConfiguration(
        maxHeightFraction: 0.75,
        // maxWidthFraction, minWidthFraction, minHeightFraction are similar.
        maxWidthFraction: 0.8,
        minWidthFraction: 0.8,
        minHeightFraction: 0.45,
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
      ),
      showSelectedItemAsTrigger: true,
      initiallySelectedItemIndex: 0,
      itemsList: workList,
      onItemSelected: (String selectedItem) {
        this._user.Work = selectedItem;
      },
      itemBuilder:
          (BuildContext context, String item, OnItemTapped onItemTapped) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 2.5),
          child: RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            //color: AppTheme.primaryBtnColor,
            color: Colors.deepOrange,
            onPressed: () {
              onItemTapped();
              //_registerUser();
            },
            child: Text(
              '${item}',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }

  List<String> mapToList(Map data, String index) {
    return data[index];
  }
}
