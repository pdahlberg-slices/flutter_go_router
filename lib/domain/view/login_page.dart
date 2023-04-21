
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('login page'),
    );
    /*return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        var go = Provider.of<AppRouter>(context, listen: false);
        return Scaffold(
          body: ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = state.items[index];
              return ListTile(
                title: Text(item.name),
                onTap: () {
                  //context.go('/details', extra: item.id);
                  //router.push(ItemDetailsRoute(id: item.id));
                  go.router.goNamed('details', extra: item.id);
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {  
              context.loginBloc.add(ItemAdded(RpgNameGenerator.getName("elf", state.items.length % 2 == 0 ? "female" : "male")));
            },
          ),
        );
      }
    );*/
  }

}

