import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime/models/api.bloc.dart';
import 'package:realtime/models/users.model.dart';

enum UserEventType { LOAD, SET_LIST }

class UserEvent {
  final UserEventType type;
  final dynamic payload;

  UserEvent({required this.type, this.payload});

  static UserEvent load() {
    return UserEvent(type: UserEventType.LOAD);
  }

  static UserEvent setListUsers(List<UserModel> users) {
    return UserEvent(type: UserEventType.SET_LIST, payload: users);
  }
}

class UserState {
  bool loading = false;
  List<UserModel> items = [];

  clone() {
    UserState clone = UserState();
    clone.items = List.from(this.items);
    clone.loading = this.loading;
    return clone;
  }
}

class UserBloc extends Bloc<UserEvent, UserState> {
  final String BASE_PATH = "https://randomuser.me/api";
  final ApiBloc apiBloc;
  late StreamSubscription<ApiState> apiSubscription;

  final Dio _apiClient = Dio();

  UserBloc(UserState initialState, {required this.apiBloc})
      : super(initialState) {
    this.apiSubscription = this.apiBloc.stream.listen((apiState) {
      final users = this.mapResponseToList(apiState.response);
      this.add(UserEvent.setListUsers(users));
    });
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    UserState newState = this.state.clone();

    switch (event.type) {
      case UserEventType.LOAD:
        //newState.items.addAll(await this.fetchUsers());
        apiBloc.add(ApiEvent.get());
        newState.loading = true;
        break;
      case UserEventType.SET_LIST:
        newState.items = event.payload;
        newState.loading = false;
        break;
      default:
    }

    yield newState;
  }

  mapResponseToList(List<dynamic> results) {
    return results.map((result) => UserModel.fromJson(result)).toList();
  }

  Future<List<UserModel>> fetchUsers() async {
    final response = await _apiClient.get("$BASE_PATH/?results=50");
    final List<dynamic> results = response.data['results'];

    final users = results.map((result) => UserModel.fromJson(result)).toList();

    return Future.delayed(Duration(seconds: 2), () {
      return users;
    });
  }
}
