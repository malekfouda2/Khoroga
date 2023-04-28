class FavPlaceModel{
  String? name, image, branch, placeId;
  FavPlaceModel({
    this.name,
    this.image,
    this.branch,
    this.placeId
});
  FavPlaceModel.fromJson(Map<dynamic, dynamic> map){
    if(map == null ){
      return;
    }
    name= map['name'];
    image= map['image'];
    branch= map['branch'];
    placeId= map['placeId'];
  }
  toJson(){
    return{
      'name': name,
      'image': image,
      'branch': branch,
      'placeId': placeId,
    };
  }

}