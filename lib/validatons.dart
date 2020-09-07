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