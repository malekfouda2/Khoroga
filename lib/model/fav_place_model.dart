class FavPlaceModel{
  String? name, image, branch;
  FavPlaceModel({
    this.name,
    this.image,
    this.branch
});
  FavPlaceModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null ){
      return;
    }
    name= map['name'];
    image= map['image'];
    branch= map['branch'];
  }
  toJson(){
    return{
      'name': name,
      'image': image,
      'branch': branch,
    };
  }

}