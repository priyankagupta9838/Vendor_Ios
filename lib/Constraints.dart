
String baseIp="http://103.174.103.122:3838";


bool firstAccount=false;

// Local Storage value for users
late String userToken;
Map<dynamic,dynamic> userModel={};
List<dynamic> userDetails=[];
bool gotoProductPage=false;

// user Data
Map<String,dynamic>userRegisterData={};
int totalSeconds = 80;
RegExp emailPassword = RegExp(r'[A-Za-z0-9@._-]');




