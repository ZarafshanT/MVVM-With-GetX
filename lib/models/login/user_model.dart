// class UserModel {
//   String? token;
//   bool? isLogin;

//   UserModel({this.token, this.isLogin});

//   UserModel.fromJson(Map<String, dynamic> json) {
//     token = json['token'];
//     isLogin = json['isLogin'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['token'] = this.token;
//     data['isLogin'] = this.token;
//     return data;
//   }
// }

class UserModel {
  late final String? uid;
  late final String? email;
  late final String? name;
  
  //late final String? password;
  late final String? phoneNumber;

  UserModel({this.uid, this.email, this.name,this.phoneNumber});

  //receiving the data from server
  // The fromMap() function converts the Firestore document data
  //(a Map<String, dynamic>) into a UserModel object by mapping the values to the corresponding properties in the model class.
  factory UserModel.fromMap(map) {
    return UserModel(
        uid: map['uid'] ?? '',
        email: map['email'] ?? '',

        name: map['name'] ?? '',
        phoneNumber: map['phoneNumber']??''
        );
  }

  //sending data to our server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name':name,
      'phoneNumber': phoneNumber
    };
  }
}
