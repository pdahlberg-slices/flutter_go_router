
import 'package:admin/domain/bloc/item_list_bloc.dart';
import 'package:admin/domain/bloc/item_list_events.dart';
import 'package:admin/domain/bloc/item_list_state.dart';
import 'package:admin/domain/view/item_details_page.dart';
import 'package:admin/infra/app_router.dart';
import 'package:admin/infra/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rpgnamegenerator/rpgnamegenerator.dart';

class ItemListPage extends StatelessWidget {

  static const String label = 'Items';
  static const String path = '/items';

  const ItemListPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ItemListBloc, ItemListState>(
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
                  go.router.go('$path/${ItemDetailsPage.path}', extra: item.id);
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {  
              context.itemListBloc.add(ItemAdded(RpgNameGenerator.getName("elf", state.items.length % 2 == 0 ? "female" : "male")));
            },
          ),
        );
      }
    );
  }

}

