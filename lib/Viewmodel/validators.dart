// ✅ Validates the name field
String? validateName(String? value) {
  // Checks if the value is null or empty
  if (value == null || value.isEmpty) {
    return "Please enter your name"; // Error message
  }
  return null; // Valid input
}

// ✅ Validates the email field using a regular expression
String? validateEmail(String? value) {
  // Checks if the email is empty
  if (value == null || value.isEmpty) {
    return "Please enter your email"; // Error message
  }

  // RegExp to match a basic valid email pattern
  final RegExp emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );

  // If the email doesn't match the pattern
  if (!emailRegExp.hasMatch(value)) {
    return "Enter a valid email"; // Error message
  }

  return null; // Valid input
}

// ✅ Validates the phone number field
String? validatephonenumber(String? value) {
  // Checks if the phone number is empty
  if (value == null || value.isEmpty) {
    return "Please enter the phone number"; // Error message
  }

  // Checks if the phone number is exactly 10 digits
  if (value.length != 10) {
    return "Enter 10 digits to the phone number"; // Error message
  }

  return null; // Valid input
}

// ✅ Validates the password field
String? validatepassword(String? value) {
  // Checks if the password is empty
  if (value == null || value.isEmpty) {
    return "Please enter your password"; // Error message
  }

  // Enforces a minimum password length
  if (value.length < 6) {
    return "Please enter valid password"; // Error message
  }

  return null; // Valid input
}

// ✅ Validates the confirm password field
String? validateConfirmpassword(String? value, String password) {
  // Checks if the confirm password is empty
  if (value == null || value.isEmpty) {
    return "Please enter the confirm password"; // Error message
  }

  // Checks if confirm password matches the original password
  if (value != password) {
    return "The password is not matching"; // Error message
  }

  return null; // Valid input
}


String? validateEmailOrPhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter email or phone number';
  }

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  final phoneRegex = RegExp(r'^[0-9]{10}$');

  if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
    return 'Enter a valid email or 10-digit phone number';
  }

  return null; // Input is valid
}