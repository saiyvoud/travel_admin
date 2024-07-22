
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_admin/service/post_service.dart';


class PostProvider extends ChangeNotifier {
  PostService service = PostService();
  ImagePicker imagepicker = ImagePicker();
  final caption = TextEditingController();
  final topic = TextEditingController();
  final location = TextEditingController();
  String? category;
  String? categoryid;
  List<dynamic>? allcategory;
  String? status;
  List<dynamic>? PostAll;
  List<dynamic>? PostBeforSelectcate;
  List<dynamic>? PostBeforSearch;
  bool issearch = false;
  String selectedcate = "";
  List<dynamic> myPost = [];
  List<dynamic> mysave = [];

  PostProvider() {
    initialize();
  }
  void initialize() {
    getcategory();
    getallpost();

  }

 







 

 

  Future<void> getallpost() async {
    try {
      final r = await service.getallpost();
      PostAll = r;
      notifyListeners();
    } catch (e) {}
  }

  // Future<void> pickimage() async {
  //   try {
  //     image = [];
  //     final List<XFile> pickimg = await imagepicker.pickMultiImage();
  //     if (pickimg != []) {
  //       for (var images in pickimg) {
  //         image.add(File(images.path));
  //       }
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  
  Future<void> getcategory() async {
    try {
      status = "LoadingCate";
      var r = await service.getcategory();
      allcategory = await r;

      notifyListeners();
      status = "Success";
    } catch (e) {}
  }

  
}