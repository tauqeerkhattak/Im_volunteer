const String vapidKey =
    'BObhGi6Xf3yREvhNqEjA64zuHuDryeX3Do8i32FLY-Yp4n87cDDFsTPjMNyQCI2nlD2_xJzWdsE-5R2XP2JLaCk';
const emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';

String? emailValidator(String? value) {
  if (value == null) {
    return 'Email is empty!';
  } else if (value == '') {
    return 'Email is empty!';
  } else if (!RegExp(emailRegex).hasMatch(value)) {
    return 'Email is invalid!';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null) {
    return 'Password is empty!';
  } else if (value == '') {
    return 'Password is empty!';
  } else if (value.length < 6) {
    return 'Password can\'t be less than 6 characters';
  }
  return null;
}

String? stringValidator(String? value) {
  if (value == null) {
    return 'Field is empty!';
  } else if (value == '') {
    return 'Field is empty!';
  }
  return null;
}
