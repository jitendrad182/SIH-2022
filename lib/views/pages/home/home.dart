import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_college/const/color_const.dart';
import 'package:my_college/const/image_const.dart';
import 'package:my_college/controllers/college_controller.dart';
import 'package:my_college/controllers/find_college_controller.dart';
import 'package:my_college/utils/app_sizes.dart';
import 'package:my_college/views/widgets/custom_app_bars/custom_app_bar_2.dart';
import 'package:my_college/views/widgets/custom_app_bars/custom_app_bar_3.dart';
import 'package:my_college/views/widgets/custom_drawer/custom_drawer_1.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final CollegeController _collegeController = Get.find();

  @override
  Widget build(BuildContext context) {
    AppSizes.mediaQueryHeightWidth();
    return Scaffold(
      appBar: appBar3,
      drawer: Drawer1(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConst.primaryColor,
        child: const Icon(Icons.search_sharp),
        onPressed: () {
          Get.to(() => FindMyCollege());
        },
      ),
      body: SafeArea(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: _collegeController.length(),
          itemBuilder: (context, index) {
            return Padding(
              padding: AppSizes.horizontalPadding10,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => CollegeInfoPage(index: index));
                    },
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              ImageConst.college,
                            ),
                          ),
                          Padding(
                            padding: AppSizes.padding10,
                            child: Text(
                              _collegeController.collegeName(index),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class FindMyCollege extends StatelessWidget {
  FindMyCollege({Key? key}) : super(key: key);

  final _findCollegeController = Get.put(FindCollegeController());
  final CollegeController _controller2 = Get.put(CollegeController());
  double min_value = 0;
  double max_value = 10;

  DropdownButton streamDropDown(List namelist) {
    List<DropdownMenuItem<String>> currencyItemlist = [];
    for (String item in namelist) {
      var menueItem = DropdownMenuItem(
        child: Text(item),
        value: item,
      );
      currencyItemlist.add(menueItem);
    }
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(20),
      value: _findCollegeController.stream(),
      items: currencyItemlist,
      onChanged: (value) {
        _findCollegeController.updateStream(value.toString());
      },
    );
  }

  DropdownButton stateDropDown(List namelist) {
    List<DropdownMenuItem<String>> currencyItemlist = [];
    for (String item in namelist) {
      var menueItem = DropdownMenuItem(
        child: Text(item),
        value: item,
      );
      currencyItemlist.add(menueItem);
    }
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(20),
      value: _findCollegeController.state(),
      items: currencyItemlist,
      onChanged: (value) {
        _findCollegeController.updateState(value.toString());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 20),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Stream", style: TextStyle(fontSize: 25)),
                        const SizedBox(
                          width: 40,
                        ),
                        Obx(() {
                          return streamDropDown([
                            'Engineering',
                            'Management',
                            'Science',
                            'Commerce',
                            'Arts',
                            'Hotel Management',
                            'Agriculture',
                            'Medical',
                            'Pharmacy',
                            'Law'
                          ]);
                        })
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("State  ", style: TextStyle(fontSize: 25)),
                        const SizedBox(
                          width: 40,
                        ),
                        Obx(() {
                          return stateDropDown([
                            'Andhra Pradesh',
                            'Arunachal Pradesh',
                            'Assam',
                            'Bihar',
                            'Chhattisgarh',
                            'Goa',
                            'Gujarat',
                            'Haryana',
                            'Himachal Pradesh',
                            'Jammu and Kashmir',
                            'Jharkhand',
                            'Karnataka',
                            'Kerala',
                            'Madhya Pradesh',
                            'Maharashtra',
                            'Manipur',
                            'Meghalaya',
                            'Mizoram',
                            'Nagaland',
                            'Odisha',
                            'Punjab',
                            'Rajasthan',
                            'Sikkim',
                            'Tamil Nadu',
                            'Telangana',
                            'Tripura',
                            'Uttarakhand',
                            'Uttar Pradesh',
                            'West Bengal',
                            'Andaman and Nicobar Islands',
                            'Chandigarh',
                            'Dadra and Nagar Haveli',
                            'Daman and Diu',
                            'Delhi',
                            'Lakshadweep',
                            'Puducherry',
                          ]);
                        })
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Obx(() {
                      return Column(
                        children: [
                          const Text("Academic ", style: ktextstyle),
                          Text(
                            "${_findCollegeController.academic()}",
                            style: kNumbertextStyle2,
                          ),
                          Slider(
                            value: _findCollegeController.academic(),
                            min: 0,
                            divisions: 50,
                            max: 10,
                            inactiveColor: kinactiveColour,
                            activeColor: kActiveColour,
                            thumbColor: kthumbColour,
                            onChanged: (double slidervalue) {
                              _findCollegeController
                                  .updateAcademic(slidervalue);
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Obx(() {
                      return Column(
                        children: [
                          const Text("Accommodation", style: ktextstyle),
                          Text(
                            "${_findCollegeController.accommodation()}",
                            style: kNumbertextStyle2,
                          ),
                          Slider(
                            value: _findCollegeController.accommodation(),
                            min: 0,
                            divisions: 50,
                            max: 10,
                            inactiveColor: kinactiveColour,
                            activeColor: kActiveColour,
                            thumbColor: kthumbColour,
                            onChanged: (double slidervalue) {
                              _findCollegeController
                                  .updateAccommodation(slidervalue);
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Obx(() {
                      return Column(
                        children: [
                          const Text("Faculty ", style: ktextstyle),
                          Text(
                            "${_findCollegeController.faculty()}",
                            style: kNumbertextStyle2,
                          ),
                          Slider(
                            value: _findCollegeController.faculty(),
                            min: 0,
                            max: 10,
                            inactiveColor: kinactiveColour,
                            activeColor: kActiveColour,
                            thumbColor: kthumbColour,
                            onChanged: (double slidervalue) {
                              _findCollegeController.updateFaculty(slidervalue);
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Obx(() {
                      return Column(
                        children: [
                          const Text("Infrastructure ", style: ktextstyle),
                          Text(
                            "${_findCollegeController.infrastructure()}",
                            style: kNumbertextStyle2,
                          ),
                          Slider(
                            value: _findCollegeController.infrastructure(),
                            min: min_value,
                            max: max_value,
                            inactiveColor: kinactiveColour,
                            activeColor: kActiveColour,
                            thumbColor: kthumbColour,
                            onChanged: (double slidervalue) {
                              _findCollegeController
                                  .updateInfrastructure(slidervalue);
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Obx(() {
                      return Column(
                        children: [
                          const Text("Placement ", style: ktextstyle),
                          Text(
                            "${_findCollegeController.placement()}",
                            style: kNumbertextStyle2,
                          ),
                          Slider(
                            value: _findCollegeController.placement(),
                            min: min_value,
                            max: max_value,
                            inactiveColor: kinactiveColour,
                            activeColor: kActiveColour,
                            thumbColor: kthumbColour,
                            onChanged: (double slidervalue) {
                              _findCollegeController
                                  .updatePlacement(slidervalue);
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Obx(() {
                      return Column(
                        children: [
                          const Text("Social Life", style: ktextstyle),
                          Text(
                            "${_findCollegeController.socialLife()}",
                            style: kNumbertextStyle2,
                          ),
                          Slider(
                            value: _findCollegeController.socialLife(),
                            min: min_value,
                            max: max_value,
                            inactiveColor: kinactiveColour,
                            activeColor: kActiveColour,
                            thumbColor: kthumbColour,
                            onChanged: (double slidervalue) {
                              _findCollegeController
                                  .updateSocialLife(slidervalue);
                            },
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            Material(
              borderOnForeground: true,
              color: kActiveColour,
              borderRadius: BorderRadius.circular(15),
              elevation: 10,
              child: MaterialButton(
                padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                child: const Text(
                  'Find My College',
                  style: TextStyle(fontSize: 28),
                ),
                onPressed: () async {
                  // _controller2.getFilterCollegesInfo(_findCollegeController);
                  Get.to(() => HomePage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CollegeInfoPage extends StatelessWidget {
  CollegeInfoPage({Key? key, required this.index}) : super(key: key);

  final int index;
  final CollegeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: AppSizes.verticalPadding10,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(ImageConst.college2),
                  )),
                  height: 400,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      _controller.collegeName(index).toString(),
                      style: TextStyle(
                        backgroundColor: Colors.black12,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 7),
                      child: Text(
                        " 4/5",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Row(
                  children: const [
                    Icon(Icons.location_on),
                    Text("Jaipur, Rajasthan"),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Icon(
                      Icons.call,
                      color: Colors.orange,
                      size: 40,
                    ),
                    Icon(
                      Icons.monetization_on_outlined,
                      color: Colors.orange,
                      size: 40,
                    ),
                    Icon(
                      Icons.message,
                      color: Colors.orange,
                      size: 40,
                    ),
                    Icon(
                      Icons.star_border,
                      color: Colors.orange,
                      size: 40,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                      "DESCRIPTION",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text(
                        "The Indian Institute of Technology IIT is a group of educational\ninstitutes in India set up by the government to produce high quality\nscientists, engineers and technologists. "),
                  ],
                ),
              ),
              const SizedBox(
                height: 170,
              ),
              Material(
                borderOnForeground: true,
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(15),
                elevation: 10,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                  child: const Text(
                    'APPLY NOW',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    print("APPLY BUTTON PRESSED");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
//
// Padding(
// padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
// child: DropdownButtonFormField<String>(
// validator: validator,
// decoration: InputDecoration(
// filled: true,
// prefixIcon: Icon(Icons.location_city),
// hintStyle: TextStyle(color: Colors.grey),
// border: UnderlineInputBorder(
// borderSide: BorderSide.none,
// borderRadius: BorderRadius.circular(30),
// ),
// ),
// focusColor: Colors.white,
// value: value,
// style: TextStyle(color: Colors.white),
// iconEnabledColor: Colors.black,
// items:
// <String>['Rajasthan'].map<DropdownMenuItem<String>>((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(
// value,
// style: TextStyle(color: Colors.black),
// ),
// );
// }).toList(),
// hint: Text(
// "Select State",
// style: TextStyle(
// color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
// ),
// onChanged: onChanged,
// ),
// )
//

const kNumbertextStyle2 = TextStyle(fontWeight: FontWeight.w900, fontSize: 25);
const ktextstyle = TextStyle(
  fontSize: 22.0,
);
const kActiveColour = Color(0xff1071E2);
const kthumbColour = Color.fromARGB(255, 9, 124, 255);
const kinactiveColour = Color(0xFF8D8E98);
const kappbarcolor = Color.fromRGBO(230, 226, 226, 1);
const kcardstyle = TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
