import 'package:challenge_tractian_app/shared/models/compane_model.dart';
import 'package:challenge_tractian_app/shared/repository/http_api_repository.dart';
import 'package:challenge_tractian_app/shared/states/states.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  final HttpApiRepository repository;

  HomeController({required this.repository});

  List<CompanyModel> companies = [];

  StateModel _state = Loading();

  getCompanies() async {
    setState(Loading());
    try {
      companies = await repository.getCompanies();
      setState(Complete());
    } catch (e) {
      setState(Error(error: '$e'));
      print("$e");
    }
    notifyListeners();
  }

  getState() {
    return _state;
  }

  setState(StateModel newState) {
    _state = newState;
  }
}
