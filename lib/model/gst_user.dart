import 'dart:core';

class GstUserModel {
  String id;
  late String name;
  late String address;
  late String additionalPlace;
  late String stateJurisdiction;
  late String centreJurisdiction;
  late String taxpayerType;
  late String constituonofBusiness;
  late String dateOfRegistration;
  late String dateOfCancelation;
  GstUserModel({required Map object, required this.id}) {
    this.name = object["name"];
    this.address = object["address"];
    this.additionalPlace = object["additional_place"];
    this.stateJurisdiction = object["state_jurisdiction"];
    this.centreJurisdiction = object["centre_jurisdiction"];
    this.taxpayerType = object["taxpayer_type"];
    this.constituonofBusiness = object["constituion_of_business"];
    this.dateOfRegistration = object["date_of_registration"];
    this.dateOfCancelation = object["date_of_cancelation"];
  }
}
