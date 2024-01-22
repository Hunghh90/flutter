class Student{
  int? id;
  String name;
  int age;
  String image;
  String address;
  Student({this.id,required this.name,required this.age,required this.image,required this.address});
  factory Student.valueFromJson(Map<String, dynamic> json){
    return Student(
        id: json["id"] as int,
        name: json["name"] as String,
        age: json["age"] as int,
        image: json["image"] as String,
        address: json["address"] as String
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'image': image,
      'address': address,
    };
  }

  @override
  String toString() {
    // TODO: implement toString
    return "name: $name, address: $address";
  }
}