import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/business_list_event.dart';
import 'package:task/bloc/business_list_state.dart';
import 'package:task/utils/api_services.dart';

import '../models/business_model.dart';

class BusinessListBloc extends Bloc<BusinessEvent, BusinessState> {
  BusinessListBloc() : super(BusinessState()) {
    on<GetBusinessListEvent>(getBusinessList);
    on<BusinessClickEvent>(getBusiness);
  }
  BusinessesList? businessList;
  Businesses? detailslist;
  bool isLoading = true;
  bool isDetailsLoading = true;
  FutureOr<void> getBusinessList(
      GetBusinessListEvent event, Emitter<BusinessState> emit) async {
    try {
      final response =
          await ApiService.get('v3/businesses/search?location=NYC');
      if (response is Map) {
        businessList = BusinessesList.fromJson(response);
        isLoading = false;
        emit(GetBuinessState());
      } else {
        print('Failed to load businesses');
      }
    } catch (e) {
      print('Failed to load businesses: $e');
    }
  }

  FutureOr<void> getBusiness(
      BusinessClickEvent event, Emitter<BusinessState> emit) async {
    detailslist = event.details;
    print(detailslist);

    emit(BuinessDetailsState());
  }
}
