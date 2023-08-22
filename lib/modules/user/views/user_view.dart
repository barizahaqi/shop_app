import 'package:flutter/material.dart';
import 'package:shop_app/modules/user/views/components/user_list.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        padding: EdgeInsets.all(24), child: UserList());
  }
}
