import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime/crud/list.screen.dart';
import 'package:realtime/models/api.bloc.dart';
import 'package:realtime/models/users.bloc.dart';
import 'package:realtime/screens/users.screen.dart';
import 'package:realtime/theming.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final apiBloc = BlocProvider(create: (context) => ApiBloc(ApiState()));

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
            create: (context) =>
                UserBloc(UserState(), apiBloc: ApiBloc(ApiState()))
                  ..add(UserEvent(type: UserEventType.LOAD)))
      ],
      child: UsersScreen(),
    ),
  ));
}
