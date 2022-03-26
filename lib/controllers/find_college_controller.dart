import 'package:get/get.dart';
import 'package:my_college/models/find_college_model.dart';

class FindCollegeController extends GetxController {
  final Rx<FindCollegeModel> _collegeModel = FindCollegeModel(
    state: 'Rajasthan',
    stream: 'Engineering',
    rating: 6.0,
    academic: 6.0,
    accommodation: 6.0,
    faculty: 6.0,
    infrastructure: 6.0,
    placement: 6.0,
    socialLife: 6.0,
  ).obs;

  String state() {
    return _collegeModel.value.state;
  }

  updateState(String state) {
    _collegeModel.update((val) {
      val!.state = state;
    });
  }

  String stream() {
    return _collegeModel.value.stream;
  }

  updateStream(String stream) {
    _collegeModel.update((val) {
      val!.stream = stream;
    });
  }

  double rating() {
    return _collegeModel.value.rating;
  }

  updateRating(double rating) {
    _collegeModel.update((val) {
      val!.rating = rating;
    });
  }

  double academic() {
    return _collegeModel.value.academic;
  }

  updateAcademic(double academic) {
    _collegeModel.update((val) {
      val!.academic = academic;
    });
  }

  double accommodation() {
    return _collegeModel.value.accommodation;
  }

  updateAccommodation(double accommodation) {
    _collegeModel.update((val) {
      val!.accommodation = accommodation;
    });
  }

  double faculty() {
    return _collegeModel.value.faculty;
  }

  updateFaculty(double faculty) {
    _collegeModel.update((val) {
      val!.faculty = faculty;
    });
  }

  double infrastructure() {
    return _collegeModel.value.infrastructure;
  }

  updateInfrastructure(double infrastructure) {
    _collegeModel.update((val) {
      val!.infrastructure = infrastructure;
    });
  }

  double placement() {
    return _collegeModel.value.placement;
  }

  updatePlacement(double placement) {
    _collegeModel.update((val) {
      val!.placement = placement;
    });
  }

  double socialLife() {
    return _collegeModel.value.socialLife;
  }

  updateSocialLife(double socialLife) {
    _collegeModel.update((val) {
      val!.socialLife = socialLife;
    });
  }
}
