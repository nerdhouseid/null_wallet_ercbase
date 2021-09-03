String cut0x({required String value}){
  if(value.startsWith('0x')){
    return value.substring(2);
  }
  return value;
}
String with0x({required String value}){
  if(value.startsWith('0x')){
    return value;
  }
  return '0x'+value; 
}