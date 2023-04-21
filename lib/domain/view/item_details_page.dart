
import 'package:admin/domain/bloc/item_details_bloc.dart';
import 'package:admin/domain/bloc/item_details_events.dart';
import 'package:admin/domain/bloc/item_details_state.dart';
import 'package:admin/domain/model/item.dart';
import 'package:admin/infra/extension_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailsPage extends StatelessWidget {

  static const String label = 'Item Details';
  static const String path = 'details';
  final int id;

  const ItemDetailsPage({
    super.key,
    required this.id,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    debugPrint("[wrappedRoute] context.itemDetailsBloc.state => ${context.itemDetailsBloc.state}");
    debugPrint("[wrappedRoute] ItemDetailsPage.id => $id");
    context.itemDetailsBloc.add(ItemAskedFor(id));
    return this;
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("ItemDetailsState -> build: ${id} (before)");

    return BlocListener<ItemDetailsBloc, ItemDetailsState>(
      listener: (context, state) {
        debugPrint("ItemDetailsState -> build: ${id} (inside listener)");
        debugPrint("ItemDetailsState -> state: ${state.item.id} (listener)");
      },
      child: BlocBuilder<ItemDetailsBloc, ItemDetailsState>(
        builder: (context, state) {
          debugPrint("ItemDetailsState -> build: ${id} (inside builder)");
          debugPrint("ItemDetailsState -> state: ${state.item.id} (builder)");

          if(state.isError) {
            return Text(state.getErrorMsg());
          } else if(id != state.item.id) {
            return const CircularProgressIndicator();
          } else {
            return ItemDetailsBody(
              item: state.item,
            );
          }
        },
      ),
    );
  }

}

class ItemDetailsBody extends StatelessWidget {

  final Item item;

  const ItemDetailsBody({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("#${item.id}"),
            Text(item.name),
            const Text("..."),
            Text("~${item.timestamp}~"),
          ],
        ),
      ),
    );
  }

}
