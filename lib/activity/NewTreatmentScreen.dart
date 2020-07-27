import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ventilator/activity/Dashboard.dart';
import 'package:ventilator/database/DatabaseHelper.dart';
import 'package:ventilator/database/VentilatorOMode.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';

class NewTreatmentScreen extends StatefulWidget {
  @override
  _NewTreatmentScreenState createState() => _NewTreatmentScreenState();
}

class _NewTreatmentScreenState extends State<NewTreatmentScreen> {
  TextEditingController patientId = TextEditingController();
  TextEditingController nameId = TextEditingController();
  TextEditingController ageId = TextEditingController();
  TextEditingController heightId = TextEditingController();
  TextEditingController weightId = TextEditingController();
  // bool isNumericMode = false;
  // bool keyboardEnable = false;
  // bool patientIdEnable = false;
  // bool nameEnable = false;
  // bool shiftEnabled = false;
  bool maleEnabled = true;
  bool femaleEnabled = false;
  // bool ageEnabled = false;
  bool heightEnabled = false;
  bool adultEnabled = true;
  bool pediatricEnabled = false;
  double commonValue = 0;
  String calculatingIn = "cm";
  SharedPreferences preferences;
  var dbHelper = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(
                    "New Patient",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        heightEnabled = false;
                      });
                    },
                    child: Container(
                      width: 210,
                      child: TextFormField(
                        autofocus: true,
                        showCursor: true,
                        onTap: () {
                          setState(() {
                            heightEnabled = false;
                          });
                        },
                        controller: nameId,
                        decoration: InputDecoration(
                          labelText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        heightEnabled = false;
                      });
                    },
                    child: Container(
                      width: 210,
                      child: TextFormField(
                        showCursor: true,
                        onTap: () {
                          setState(() {
                            heightEnabled = false;
                          });
                        },
                        controller: patientId,
                        cursorColor: Color(0xFF171e27),
                        decoration: InputDecoration(
                          labelText: "Patient ID",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      width: 200,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                maleEnabled = true;
                                femaleEnabled = false;
                                // keyboardEnable = true;
                              });
                            },
                            child: Material(
                              child: Card(
                                  color: maleEnabled
                                      ? Color(0xFF171e27)
                                      : Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(22.0),
                                    child: Text(
                                      "Male",
                                      style: TextStyle(
                                          color: maleEnabled
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                maleEnabled = false;
                                femaleEnabled = true;
                                // keyboardEnable = true;
                              });
                            },
                            child: Material(
                              child: Card(
                                  color: femaleEnabled
                                      ? Color(0xFF171e27)
                                      : Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(22.0),
                                    child: Text(
                                      "Female",
                                      style: TextStyle(
                                          color: femaleEnabled
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Container(
                        width: 230,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  adultEnabled = true;
                                  pediatricEnabled = false;
                                  // keyboardEnable = true;
                                });
                              },
                              child: Material(
                                child: Card(
                                    color: adultEnabled
                                        ? Color(0xFF171e27)
                                        : Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(22.0),
                                      child: Text(
                                        "Adult",
                                        style: TextStyle(
                                            color: adultEnabled
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    )),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  adultEnabled = false;
                                  pediatricEnabled = true;
                                  // keyboardEnable = true;
                                });
                              },
                              child: Material(
                                child: Card(
                                    color: pediatricEnabled
                                        ? Color(0xFF171e27)
                                        : Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(22.0),
                                      child: Text(
                                        "Pediatric",
                                        style: TextStyle(
                                            color: pediatricEnabled
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    )),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0, top: 36, right: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        heightEnabled = false;
                        // FocusScope.of(context).unfocus();
                      });
                    },
                    child: Container(
                      width: 250,
                      child: TextFormField(
                        showCursor: true,
                        maxLength: 3,
                        maxLines: 1,
                        keyboardType: TextInputType.number,
                        controller: ageId,
                        onTap: () {},
                        onChanged: (value) {
                          if (value.length >= 3) {
                            Fluttertoast.showToast(
                                msg: "Only 3 digits allowed");
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Age",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            heightEnabled = true;
                            FocusScope.of(context).unfocus();
                          });
                        },
                        child: Container(
                          width: 120,
                          child: TextFormField(
                            showCursor: true,
                            readOnly: true,
                            enabled: false,
                            maxLines: 1,
                            controller: heightId,
                            decoration: InputDecoration(
                              labelText: "Height",
                              suffixText: calculatingIn,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            heightEnabled = true;
                            FocusScope.of(context).unfocus();
                          });
                        },
                        child: Container(
                          width: 120,
                          child: TextFormField(
                            showCursor: true,
                            readOnly: true,
                            enabled: false,
                            maxLines: 1,
                            controller: weightId,
                            decoration: InputDecoration(
                              labelText: "IBW",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      savePatientData();
                    },
                    child: Container(
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Color(0xFF424242),
                          borderRadius: BorderRadius.circular(5)),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: heightEnabled ? 0 : 21,
            ),
            // keyboardEnable
            //     ?
            heightEnabled
                ? Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 310,
                          child: CupertinoPicker(
                              itemExtent: 30,
                              onSelectedItemChanged: (int index) {
                                setState(() {
                                  heightId.text =
                                      getDataheight(index).toString();
                                      if(80 < getDataheight(index) && getDataheight(index) <= 128){
                                       setState(() {
                                        weightId.text =(((0.0037 * getDataheight(index) -0.4018) *getDataheight(index)) +18.62).toInt().toString();
                                      }); 
                                      }else if(129 <= getDataheight(index) && getDataheight(index)<265){
                                        setState(() {
                                      maleEnabled == true
                                          ? weightId.text =
                                              ((0.9079 * getDataheight(index)) -88.022).toInt().toString()
                                          : femaleEnabled == true
                                              ? weightId.text = ((0.9049 *getDataheight(index)) -88.022).toInt().toString()
                                              : 0.toString();
                                    });
                                      }
                                  // if (getDataheight(index) <= 70) {
                                  //   setState(() {
                                  //     weightId.text = ((0.125 * getDataheight(index)) - 0.75).toInt().toString();
                                  //   });
                                  // } else if (70 < getDataheight(index) &&
                                  //     getDataheight(index) <= 128) {
                                  //   setState(() {
                                  //     weightId.text =(((0.0037 * getDataheight(index) -0.4018) *getDataheight(index)) +18.62).toInt().toString();
                                  //   });
                                  // } else if (getDataheight(index) >= 265) {
                                  //   setState(() {
                                  //     maleEnabled == true
                                  //         ? weightId.text =
                                  //             ((0.9079 * getDataheight(index)) -88.022).toInt().toString()
                                  //         : femaleEnabled == true
                                  //             ? weightId.text = ((0.9049 *getDataheight(index)) -88.022).toInt().toString()
                                  //             : 0.toString();
                                  //   });
                                  // }
                                });
                              },
                              children: List.generate(
                                  176,
                                  (index) => Center(
                                        child: Text(
                                            (getDataheight(index)).toString()),
                                      ))),
                        ),
                      ),
                    ],
                  )
                : Container()
            // : Align(
            //     alignment: Alignment.bottomCenter,
            //     child: Container(
            //       color: Color(0xFF171e27),
            //       child: VirtualKeyboard(
            //           height: 308,
            //           textColor: Colors.white,
            //           type: isNumericMode
            //               ? VirtualKeyboardType.Numeric
            //               : VirtualKeyboardType.Alphanumeric,
            //           onKeyPress: _onKeyPress),
            //     ),
            //   )
          ],
        ),
      ),
    );
  }

  getDataheight(index) {
        return index == 0
        ? 80
        : index == 1
            ? 81
            : index == 2
                ? 82
                : index == 3
                    ? 83
                    : index == 4
? 84
: index == 5
    ? 85
    : index == 6
        ? 86
        : index == 7
            ? 87
            : index == 8
                ? 88
                : index == 9
                    ? 89
                    : index == 10
? 90
: index == 11
    ? 91
    : index == 12
        ? 92
        : index == 13
            ? 93
            : index == 14
                ? 94
                : index == 15
                    ? 95
                    : index == 16
? 96
: index ==
        17
    ? 97
    : index == 18
        ? 98
        : index == 19 ? 99 
        : index == 20 ? 100 
        : index == 21 ? 101 
        : index == 22 ? 102 
        : index == 23 ? 103 
        : index == 24 ? 104 
        : index == 25 ? 105 
        : index == 26 ? 106 
        : index == 27 ? 107 
        : index == 28 ? 108 
        : index == 29 ? 109 
        : index == 30 ? 110 
        : index == 31 ? 111 
        : index == 32 ? 112 
        : index == 33 ? 113 
        : index == 34 ? 114 
        : index == 35 ? 115 
        : index == 36 ? 116 
        : index == 37 ? 117 
        : index == 38 ? 118 
        : index == 39 ? 119 
        : index == 40 ? 120 
        : index == 41 ? 121 
        : index == 42 ? 122 
        : index == 43 ? 123 
        : index == 44 ? 124 
        : index == 45 ? 125 
        : index == 46 ? 126 
        : index == 47 ? 127 
        : index == 48 ? 128 
        : index == 49 ? 129 
        : index == 50 ? 130 
        : index == 51 ? 131 
        : index == 52 ? 132 
        : index == 53 ? 133 
        : index == 54 ? 134 
        : index == 55 ? 135 
        : index == 56 ? 136 
        : index == 57 ? 137 
        : index == 58 ? 138 
        : index == 59 ? 139 
        : index == 60 ? 140 
        : index == 61 ? 141 
        : index == 62 ? 142 
        : index == 63 ? 143 
        : index == 64 ? 144 
        : index == 65 ? 145 
        : index == 66 ? 146
        : index == 67 ? 147 
        : index == 68 ? 148 
        : index == 69 ? 149 
        : index == 70 ? 150 
        : index == 71 ? 151 
        : index == 72 ? 152 
        : index == 73 ? 153 
        : index == 74 ? 154 
        : index == 75 ? 155 
        : index == 76 ? 156
        : index == 77 ? 157 
        : index == 78 ? 158 
        : index == 79 ? 159 
        : index == 80 ? 160 
        : index == 81 ? 161 
        : index == 82 ? 162 
        : index == 83 ? 163 
        : index == 84 ? 164 
        : index == 85 ? 165 
        : index == 86 ? 166
        : index == 87 ? 167 
        : index == 88 ? 168 
        : index == 89 ? 169 
        : index == 90 ? 170 
        : index == 91 ? 181 
        : index == 92 ? 182 
        : index == 93 ? 183 
        : index == 94 ? 184 
        : index == 95 ? 185 
        : index == 96 ? 186
        : index == 97 ? 187 
        : index == 98 ? 188 
        : index == 99 ? 189 
        : index == 100 ? 190 
        : index == 101 ? 191 
        : index == 102 ? 192 
        : index == 103 ? 193 
        : index == 104 ? 194 
        : index == 105 ? 195 
        : index == 106 ? 196
        : index == 107 ? 197 
        : index == 108 ? 198 
        : index == 109 ? 199 
        : index == 110 ? 200 
        : index == 111 ? 201 
        : index == 112 ? 202 
        : index == 113 ? 203 
        : index == 114 ? 204 
        : index == 115 ? 205 
        : index == 116 ? 206
        : index == 117 ? 207 
        : index == 118 ? 208 
        : index == 119 ? 209 
        : index == 120 ? 210 
        : index == 121 ? 211 
        : index == 122 ? 212 
        : index == 123 ? 213 
        : index == 124 ? 214 
        : index == 125 ? 215 
        : index == 126 ? 216
        : index == 127 ? 217 
        : index == 128 ? 218 
        : index == 129 ? 219 
        : index == 130 ? 220 
        : index == 131 ? 221 
        : index == 132 ? 222 
        : index == 133 ? 223 
        : index == 134 ? 224 
        : index == 135 ? 225 
        : index == 136 ? 226
        : index == 137 ? 227 
        : index == 138 ? 228 
        : index == 139 ? 229
        : index == 140 ? 230 
        : index == 141 ? 231 
        : index == 142 ? 232 
        : index == 143 ? 233 
        : index == 144 ? 234 
        : index == 145 ? 235 
        : index == 146 ? 236
        : index == 147 ? 237 
        : index == 148 ? 238 
        : index == 149 ? 239
        : index == 150 ? 240 
        : index == 151 ? 241 
        : index == 152 ? 242 
        : index == 153 ? 243 
        : index == 154 ? 244 
        : index == 155 ? 245 
        : index == 156 ? 246
        : index == 157 ? 247 
        : index == 158 ? 248 
        : index == 159 ? 249
        : index == 160 ? 250 
        : index == 161 ? 251 
        : index == 162 ? 252 
        : index == 163 ? 253 
        : index == 164 ? 254 
        : index == 165 ? 255 
        : index == 166 ? 256
        : index == 167 ? 257 
        : index == 168 ? 258 
        : index == 169 ? 259
        : index == 170 ? 260 
        : index == 171 ? 261 
        : index == 172 ? 262 
        : index == 173 ? 263 
        : index == 174 ? 264 
        : index == 175 ? 265 
         : "";}

  // /// Fired when the virtual keyboard key is pressed.
  // _onKeyPress(VirtualKeyboardKey key) {
  //   if (patientIdEnable == true) {
  //     setState(() {
  //       if (key.keyType == VirtualKeyboardKeyType.String) {
  //         patientId.text =
  //             patientId.text + (shiftEnabled ? key.capsText : key.text);
  //       } else if (key.keyType == VirtualKeyboardKeyType.Action) {
  //         switch (key.action) {
  //           case VirtualKeyboardKeyAction.Backspace:
  //             if (patientId.text.length == 0) return;
  //             patientId.text =
  //                 patientId.text.substring(0, patientId.text.length - 1);
  //             break;
  //           // case VirtualKeyboardKeyAction.Return:
  //           //   patientId.text = patientId.text + '\n';
  //           //   break;
  //           case VirtualKeyboardKeyAction.Space:
  //             patientId.text = patientId.text + key.text;
  //             break;
  //           case VirtualKeyboardKeyAction.Shift:
  //             shiftEnabled = !shiftEnabled;
  //             break;
  //           default:
  //         }
  //       }
  //     });

  //     // Update the screen
  //     setState(() {});
  //   } else if (nameEnable == true) {
  //     setState(() {
  //       if (key.keyType == VirtualKeyboardKeyType.String) {
  //         nameId.text = nameId.text + (shiftEnabled ? key.capsText : key.text);
  //       } else if (key.keyType == VirtualKeyboardKeyType.Action) {
  //         switch (key.action) {
  //           case VirtualKeyboardKeyAction.Backspace:
  //             if (nameId.text.length == 0) return;
  //             nameId.text = nameId.text.substring(0, nameId.text.length - 1);
  //             break;
  //           // case VirtualKeyboardKeyAction.Return:
  //           //   patientId.text = patientId.text + '\n';
  //           //   break;
  //           case VirtualKeyboardKeyAction.Space:
  //             nameId.text = nameId.text + key.text;
  //             break;
  //           case VirtualKeyboardKeyAction.Shift:
  //             shiftEnabled = !shiftEnabled;
  //             break;
  //           default:
  //         }
  //       }
  //     });

  //     // Update the screen
  //     setState(() {});
  //   } else if (ageEnabled == true) {
  //     setState(() {
  //       if (key.keyType == VirtualKeyboardKeyType.String) {
  //         ageId.text = ageId.text + (shiftEnabled ? key.capsText : key.text);
  //       } else if (key.keyType == VirtualKeyboardKeyType.Action) {
  //         switch (key.action) {
  //           case VirtualKeyboardKeyAction.Backspace:
  //             if (ageId.text.length == 0) return;
  //             ageId.text = ageId.text.substring(0, ageId.text.length - 1);
  //             break;
  //           // case VirtualKeyboardKeyAction.Return:
  //           //   patientId.text = patientId.text + '\n';
  //           //   break;
  //           case VirtualKeyboardKeyAction.Space:
  //             ageId.text = ageId.text + key.text;
  //             break;
  //           case VirtualKeyboardKeyAction.Shift:
  //             shiftEnabled = !shiftEnabled;
  //             break;
  //           default:
  //         }
  //       }
  //     });
  //   }
  // }

  savePatientData() async {
    if (patientId.text.isEmpty) {
    } else if (nameId.text.isEmpty) {
    } else {
      dbHelper.savePatient(PatientsSaveList(patientId.text, nameId.text,
          ageId.text, maleEnabled ? "1" : "2", heightId.text));
      preferences = await SharedPreferences.getInstance();
      preferences.setString("pid", patientId.text.toString());
      preferences.setString("pname", nameId.text.toString());
      preferences.setString(
          "pgender", maleEnabled ? "1" : femaleEnabled ? "2" : "0");
      preferences.setString(
          "pmode", adultEnabled ? "1" : pediatricEnabled ? "2" : "0");
      preferences.setString("page", ageId.text.toString());
      preferences.setString("pheight", heightId.text.toString());
      preferences.setString("pweight", weightId.text.toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Dashboard()),
      );
    }
  }
}
