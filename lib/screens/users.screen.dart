import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime/models/users.bloc.dart';
import 'package:realtime/models/users.model.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<UserBloc, UserState>(builder: (context, userState) {
          if (userState.loading == true) {
            return Center(child: CircularProgressIndicator());
          }

          return UserListScreen(userList: userState.items);
        }),
      )),
    );
  }
}

class UserListScreen extends StatelessWidget {
  final List<UserModel> userList;
  const UserListScreen({Key? key, required this.userList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(),
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final user = userList[index];
          return ListTile(
            title: Text("${user.title} ${user.firstname} ${user.lastname}"),
            subtitle: Text(user.email),
          );
        });
  }
}
