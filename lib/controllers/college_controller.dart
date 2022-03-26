import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_college/const/firebase_const.dart';
import 'package:my_college/models/college_model.dart';

class CollegeController extends GetxController {
  final RxList<CollegeModel> _collegeModel = <CollegeModel>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> getCollegesInfo() async {
    _collegeModel.removeRange(0, _collegeModel.length);
    try {
      await _firestore
          .collection(FirebaseConst.colleges)
          .limit(5)
          .get()
          .then((querySnapshot) async {
        for (var element in querySnapshot.docs) {
          _collegeModel.add(
            CollegeModel(
                collegeName: element[FirebaseConst.collegeName],
                state: element[FirebaseConst.state],
                stream: element[FirebaseConst.stream],
                rating: element[FirebaseConst.rating],
                academic: element[FirebaseConst.academic],
                accommodation: element[FirebaseConst.accommodation],
                faculty: element[FirebaseConst.faculty],
                infrastructure: element[FirebaseConst.infrastructure],
                placement: element[FirebaseConst.placement],
                socialLife: element[FirebaseConst.socialLife]),
          );
        }
      });
    } catch (e) {
      if (kDebugMode) {
        print('CollegeController getCollegesInfo Error = $e');
      }
    }
  }

  //TODO:
  // Future<void> getFilterCollegesInfo(
  //     FindCollegeController _findCollegeController) async {
  //   _collegeModel.removeRange(0, _collegeModel.length);
  //   try {
  //     await _firestore
  //         .collection(FirebaseConst.colleges)
  //         .where(FirebaseConst.state, isEqualTo: _findCollegeController.state())
  //         .where(FirebaseConst.stream,
  //         isEqualTo: _findCollegeController.stream())
  //         .where(FirebaseConst.rating,
  //         isGreaterThanOrEqualTo: _findCollegeController.rating())
  //         .where(FirebaseConst.academic,
  //         isGreaterThanOrEqualTo: _findCollegeController.academic())
  //         .where(FirebaseConst.accommodation,
  //         isGreaterThanOrEqualTo: _findCollegeController.accommodation())
  //         .where(FirebaseConst.faculty,
  //         isGreaterThanOrEqualTo: _findCollegeController.faculty())
  //         .where(FirebaseConst.infrastructure,
  //         isGreaterThanOrEqualTo: _findCollegeController.infrastructure())
  //         .where(FirebaseConst.placement,
  //         isGreaterThanOrEqualTo: _findCollegeController.placement())
  //         .where(FirebaseConst.socialLife,
  //         isGreaterThanOrEqualTo: _findCollegeController.socialLife())
  //         .orderBy(FirebaseConst.rating, descending: true)
  //         .limit(5)
  //         .get()
  //         .then((querySnapshot) async {
  //       for (var element in querySnapshot.docs) {
  //         _collegeModel.add(
  //           CollegeModel(
  //               collegeName: element[FirebaseConst.collegeName],
  //               state: element[FirebaseConst.state],
  //               stream: element[FirebaseConst.stream],
  //               rating: element[FirebaseConst.rating],
  //               academic: element[FirebaseConst.academic],
  //               accommodation: element[FirebaseConst.accommodation],
  //               faculty: element[FirebaseConst.faculty],
  //               infrastructure: element[FirebaseConst.infrastructure],
  //               placement: element[FirebaseConst.placement],
  //               socialLife: element[FirebaseConst.socialLife]),
  //         );
  //       }
  //     });
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('CollegeController2 getFilterCollegesInfo Error = $e');
  //     }
  //   }
  // }
  //TODO:

  int length() {
    return _collegeModel.length;
  }

  String collegeName(int index) {
    return _collegeModel[index].collegeName;
  }

  String state(int index) {
    return _collegeModel[index].state;
  }

  String stream(int index) {
    return _collegeModel[index].stream;
  }

  double rating(int index) {
    return _collegeModel[index].rating;
  }

  double academic(int index) {
    return _collegeModel[index].academic;
  }

  double accommodation(int index) {
    return _collegeModel[index].accommodation;
  }

  double faculty(int index) {
    return _collegeModel[index].faculty;
  }

  double infrastructure(int index) {
    return _collegeModel[index].infrastructure;
  }

  double placement(int index) {
    return _collegeModel[index].placement;
  }

  double socialLife(int index) {
    return _collegeModel[index].socialLife;
  }
}
