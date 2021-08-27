
import 'package:eshop_flutter/core/models/async_state.dart';
import 'package:eshop_flutter/core/models/profile_model.dart';
import 'package:eshop_flutter/core/services/order_service.dart';
import 'package:eshop_flutter/core/services/profile_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileViewModelProvider =
StateNotifierProvider<ProfileDetailViewModel, AsyncState<ProfileModel>>(
        (ref) => ProfileDetailViewModel(ref.read(profileServiceProvider)));

class ProfileDetailViewModel extends StateNotifier<AsyncState<ProfileModel>> {
  final ProfileService _profileService;

  ProfileDetailViewModel(this._profileService) : super(Initial(null)){
    loadData();
  }

  loadData() async {
    state = Loading(state.data);
    try {
      var profile = await _profileService.getProfile();
      print(profile);
      state = new Success(profile);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

  logOut() async {
    state = Loading(state.data);
    try {
      var profile = await _profileService.logOut();
      // print(profile);
      state = new Success(profile);
    } catch (exception) {
      state = Error('Something went wrong', state.data);
    }
  }

}