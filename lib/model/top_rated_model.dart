class TopRatedModel{
  String? image, name, branch,color, location;
  TopRatedModel({required this.image,required this.name,required this.branch,required this.color, required this.location});

  TopRatedModel.fromJson(Map<dynamic,dynamic> map){
    if(map==null){
      return ;
    }
    image=map['image'];
    name=map['name'];
    branch=map['branch'];
    color=map['color'];
    location= map['location'];
  }

  toJson(){
    return{
      'image':image,
      'name':name,
      'branch':branch,
      'color':color,
      'location':location,
    };
  }
}