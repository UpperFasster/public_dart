import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_court/core/models/models.dart';
import 'package:food_court/core/router/router.dart';
import 'package:food_court/core/services/services.dart';
import 'package:provider/provider.dart';

class InitalPage extends StatefulWidget {
  const InitalPage({super.key});

  @override
  State<InitalPage> createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  @override
  void initState() {
    if (getIt.get<UserStateService>().isNotInited) {
      setState(() {
        getIt.get<UserStateService>().initUser();
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserDTO? user = context.watch<UserStateService>().user;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (user == null) {
        context.go(PathName.login);
      } else {
        context.go(PathName.products);
      }
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
