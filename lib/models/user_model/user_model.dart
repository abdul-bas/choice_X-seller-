class UserModel {
  String name;
  String email;
  String? uid;
  String password;
  Map<String, dynamic>? favorite;
  List<Map<String, dynamic>>? cart;
  List<Map<String, dynamic>>? address;
  List<Map<String, dynamic>>? orders;
  UserModel(
      {required this.name,
      this.favorite,
      required this.email,
      required this.password,this.cart,this.address,this.orders,
      this.uid});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uid': uid,
      'password': password,
      'favorite': favorite ?? {},
      'cart': favorite ?? [],
      'Address': address ?? [],
      'orders':orders??[]
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      favorite: map['favorite'] ?? {},
      name: map['name'],
      email: map['email'],
      uid: map['uid'],
      password: map['password']??'',
      cart:  map['cart'] != null
          ? List<Map<String, dynamic>>.from(
              (map['cart'] as List).map((e) => Map<String, dynamic>.from(e)))
          : [], 
        address: map['Address'] != null
          ? List<Map<String, dynamic>>.from(
              (map['Address'] as List).map((e) => Map<String, dynamic>.from(e)))
          : [],
          orders:map['orders'] != null
          ? List<Map<String, dynamic>>.from(
              (map['orders'] as List).map((e) => Map<String, dynamic>.from(e)))
          : [], 
    );
  }
}
