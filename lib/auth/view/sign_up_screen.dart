import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:otoo/auth/view/otp_screen.dart';
import 'package:otoo/core/constraints/constraints.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter your mobile number",
                  style: TextStyle(fontSize: 14),
                ),
                kHeight(10),
                TextFormField(
                  controller: _phoneNumberController,
                  maxLength: 10,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your phone number";
                    } else if (value.length < 9) {
                      return "Enter correct number";
                    }
                  },
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      filled: true,
                      isDense: true,
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(11.8),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(
                              countryListTheme: const CountryListThemeData(
                                  bottomSheetHeight: 500),
                              context: context,
                              onSelect: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              },
                            );
                          },
                          child: Text(
                            "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 40)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const OtpScreen(),
                        ));
                      }
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
