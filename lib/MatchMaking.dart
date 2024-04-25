import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
class MatchMakingForm extends StatefulWidget {
  @override
  State<MatchMakingForm> createState() => _MatchMakingFormState();
}

class _MatchMakingFormState extends State<MatchMakingForm> {
  // Controllers for text fields
  final TextEditingController _nameControllerGirl = TextEditingController();
  final TextEditingController _birthDateControllerGirl = TextEditingController();
  final TextEditingController _nameControllerBoy = TextEditingController();
  final TextEditingController _birthDateControllerBoy = TextEditingController();
  final TextEditingController _birthTimeControllerGirl = TextEditingController();
  final TextEditingController _birthTimeControllerBoy = TextEditingController();
  final TextEditingController _birthPlaceControllerBoy = TextEditingController();
  final TextEditingController _birthPlaceControllerGirl = TextEditingController();
  String? _selectedCity;
  late String countryValue;
  late String stateValue;
  late String cityValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.purple[50] ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Boy\'s Detail',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                 TextFormField(
                   controller: _nameControllerBoy,
                   decoration: InputDecoration(
                     labelText: "Enter Name",
                     border: OutlineInputBorder(),


                   ),

                 ),

                  SizedBox(height: 10),
                  _buildTextFieldWithCalendar('Birth Date (DD/MM/YYYY)', _birthDateControllerBoy),
                  SizedBox(height: 10),
                  _buildTextFieldWithClock('Birth Time (hh:mm)', _birthTimeControllerBoy,context),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (newValue) {
                          // Implement logic for handling checkbox
                        },
                      ),
                      Text('Don\'t know my exact time of birth'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Select Birth Place'),
                  SelectState(
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged:(value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged:(value) {
                      setState(() {
                        cityValue = value;
                      });
                    },

                  ),
                 // _buildTextFieldWithDropDown('Birth Place', _birthPlaceControllerBoy),

                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Boy\'s Detail',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                 TextFormField(
                   controller: _nameControllerGirl,
                   decoration: InputDecoration(
                     labelText: "Enter Name",
                     border: OutlineInputBorder(),

                   ),



                 ),
                  SizedBox(height: 10),
                  _buildTextFieldWithCalendar('Birth Date (DD/MM/YYYY)', _birthDateControllerGirl),
                  SizedBox(height: 10),
                  _buildTextFieldWithClock('Birth Time (hh:mm)', _birthTimeControllerGirl,context),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(
                        value: false,
                        onChanged: (newValue) {
                          // Implement logic for handling checkbox
                        },
                      ),
                      Text('Don\'t know my exact time of birth'),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('Select Birth Place'),
                  SelectState(
                    onCountryChanged: (value) {
                      setState(() {
                        countryValue = value;
                      });
                    },
                    onStateChanged:(value) {
                      setState(() {
                        stateValue = value;
                      });
                    },
                    onCityChanged:(value) {
                      setState(() {
                        cityValue = value;
                      });
                    },

                  ),
                //  _buildTextFieldWithDropDown('Birth Place', _birthPlaceControllerGirl),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithClock(String labelText, TextEditingController controller, BuildContext context) {
    return Container(
      decoration: _textFieldDecoration(),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.access_time),
            onPressed: () async{
              // Open clock picker
              final TimeOfDay? pickedTime = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              if (pickedTime != null) {
                // Update the text field with the selected time
                controller.text = pickedTime.format(context);
              }
            },
          ),
        ),
        controller: controller,
      ),
    );
  }

  Widget _buildTextFieldWithCalendar(String labelText, TextEditingController controller) {
    return Container(
      decoration: _textFieldDecoration(),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () async{
              final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2100),
              );

              if (pickedDate != null) {
                // Update the text field with the selected date
                controller.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              }
            },
          ),
        ),
        controller: controller,
      ),
    );
  }

  Widget _buildTextFieldWithDropDown(String labelText, TextEditingController controller) {
    return Container(
      decoration: _textFieldDecoration(),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          suffixIcon: Icon(Icons.arrow_drop_down),
        ),
        controller: controller,
      ),
    );
  }

  BoxDecoration _textFieldDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ],
    );
  }
}
