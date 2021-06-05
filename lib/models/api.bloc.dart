import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime/models/common.bloc.dart';

enum ApiEventType { GET }

class ApiEvent extends CommonEvent<ApiEventType> {
  ApiEvent({type, payload}) : super(type: type, payload: payload);

  static ApiEvent get() {
    return ApiEvent(type: ApiEventType.GET);
  }
}

class ApiState {
  dynamic response = null;
}

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  final String BASE_PATH = "https://randomuser.me/api";
  final Dio _apiClient = Dio();

  ApiBloc(ApiState initialState) : super(initialState);

  @override
  Stream<ApiState> mapEventToState(ApiEvent event) async* {
    ApiState newState = ApiState();

    switch (event.type) {
      case ApiEventType.GET:
        final result = await this.load();
        newState.response = result;
        yield newState;
        break;
      default:
    }
  }

  Future<dynamic> load() async {
    final response = await _apiClient.get("$BASE_PATH/?results=50");
    final List<dynamic> results = response.data['results'];

    return Future.delayed(Duration(seconds: 1), () => results);
  }
}
