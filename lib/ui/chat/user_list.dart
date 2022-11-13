import 'package:flutter/material.dart';
import 'package:i_am_volunteer/widgets/custom_scaffold.dart';

class UserList extends StatelessWidget {
  UserList({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      screenName: 'Users List',
      body: Container(),
      scaffoldKey: scaffoldKey,
    );
  }
}
