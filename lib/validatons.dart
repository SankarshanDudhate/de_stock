bool validateName(String name) {
  name = name.trim();
  if( name == '' ) return false;
  else if( name.indexOf(' ') < 0 ) return false;
  //else if
  return true;
}

bool validateEmail(String email) {
  email = email.trim();
  RegExp emailRegExp = RegExp(r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$");
  if( email == '' ) return false;
  else if( email.indexOf(' ') >= 0 ) return false;
  else if( !emailRegExp.hasMatch(email) ) return false;
  return true;
}

bool validatePhoneNo(String phoneNo) {
  phoneNo = phoneNo.trim();
  RegExp phoneNoRegExp = RegExp(r'^[0-9]{10}$');
  if( phoneNo == '' ) return false;
  else if( phoneNo.length != 10 ) return false;
  else if( !phoneNoRegExp.hasMatch(phoneNo) ) return false;
  return true;
}

bool validatePan(String panNo) {
  panNo = panNo.trim().toUpperCase();
  RegExp panRegExp = RegExp(r"^[A-Z]{5}[0-9]{4}[A-Z]{1}$");
  if( panNo == '' ) return false;
  else if( panNo.indexOf(' ') >= 0 ) return false;
  else if( !panRegExp.hasMatch(panNo) ) return false;
  return true;
}

bool validateGST(String gstNo) {
  gstNo = gstNo.trim().toUpperCase();
  // RegExp gstRegExp = RegExp(r"^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9A-Z]{1}[Z][A-Z0-9]{1}$");
  RegExp gstRegExp = RegExp(r"^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$");
  if( gstNo == '' ) return false;
  else if( gstNo.indexOf(' ') >= 0 ) return false;
  else if( !gstRegExp.hasMatch(gstNo) ) return false;
  return true;
}