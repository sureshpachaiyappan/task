import 'package:flutter/material.dart';

import '../models/business_model.dart';

class BusinessEvent {}

class GetBusinessListEvent extends BusinessEvent {}
class BusinessClickEvent extends BusinessEvent {
  BusinessClickEvent({required this.details});
  final Businesses details;

}