import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

const kPrimaryColor = Color(0xFF121212);
const kSecondaryColor = Color(0xFF2C2F2C);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kWarninngColor = Color(0xFFF3BB1C);
const kErrorColor = Color(0xFFF03738);

const kDefaultPadding = 20.0;

const primaryColor = Color(0xFF121212);
const secondaryColor = Color(0xFF2C2F2C);
const contentColorLightTheme = Color(0xFF4B4BAF);
const contentColorDarkTheme = Color(0xFFF5FCF9);
const warninngColor = Color(0xFFF3BB1C);
const errorColor = Color(0xFFF03738);

const defaultPadding = 16.0;

const logoDarkTheme = "assets/icons/Only_logo_dark_theme.svg";
const logoLightTheme = "assets/icons/Only_logo_light_theme.svg";

const requiredField = "This field is required";
const invalidEmail = "Enter a valid email address";

final passwordValidator = MultiValidator(
  [
    RequiredValidator(errorText: requiredField),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ],
);

const InputDecoration otpInputDecoration = InputDecoration(
  filled: false,
  border: UnderlineInputBorder(),
  hintText: "0",
);

// For demo

// final List<String> demoContactsName =
// List.generate(5, (index) => "name$_{index + 1}");

final List<String> demoContactsImage =
List.generate(5, (index) => "assets/images/user_${index + 1}.png");