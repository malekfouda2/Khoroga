import 'dart:ffi';

class TopRatedModel{
  String? image, name, branch,color;
  double? lat,lng;
  TopRatedModel({required this.image,required this.name,required this.branch,required this.color, required this.lat, required this.lng});

  TopRatedModel.fromJson(Map<dynamic,dynamic> map){
    if(map==null){
      return ;
    }
    image=map['image'];
    name=map['name'];
    branch=map['branch'];
    color=map['color'];
    lat= double.tryParse(map["lat"].toString());
    lng= double.tryParse(map["lng"].toString());
  }

  toJson(){
    return{
      'image':image,
      'name':name,
      'branch':branch,
      'color':color,
      'lat':lat as double,
      'lng':lng as double,
    };
  }
}