class TopRatedModel{
  String? image, name, branch,color;
  TopRatedModel({required this.image,required this.name,required this.branch,required this.color,});

  TopRatedModel.fromJson(Map<dynamic,dynamic> map){
    if(map==null){
      return ;
    }
    image=map['image'];
    name=map['name'];
    branch=map['branch'];
    color=map['color'];
  }

  toJson(){
    return{
      'image':image,
      'name':name,
      'branch':branch,
      'color':color,
    };
  }
}