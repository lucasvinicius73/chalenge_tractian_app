abstract class StateModel {}

class NotStarted extends StateModel{}

class Loading extends StateModel {}

class Empty extends StateModel {}

class Error extends StateModel {
  final String error;

  Error({required this.error});
}

class Complete extends StateModel {}
