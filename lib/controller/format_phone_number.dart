String formatPhoneNumber(String number){
  if(number.startsWith("+251")){
    number = number.replaceRange(0, 4, "0")
      .replaceAll(" ", "");

  }
  return number;
}