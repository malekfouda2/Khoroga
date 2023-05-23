import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService{
final CollectionReference _categoryCollectionRef= FirebaseFirestore.instance.collection('Categories');
final CollectionReference _top_rated_CollectionRef= FirebaseFirestore.instance.collection('TopRated');
final CollectionReference _places_CollectionRef= FirebaseFirestore.instance.collection('Places');

Future <List<QueryDocumentSnapshot>> getCategory() async{
  var value=await _categoryCollectionRef.get();
  return value.docs;
}
Future <List<QueryDocumentSnapshot>> getPlacesByCategory(String categoryName) async {
  var value=await _places_CollectionRef.where('category', isEqualTo: categoryName).get();
  return value.docs;
    
  }

Future <List<QueryDocumentSnapshot>> getTopRated() async{
  var value=await _top_rated_CollectionRef.get();
  return value.docs;
}

}