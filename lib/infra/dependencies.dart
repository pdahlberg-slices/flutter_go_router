
import 'package:admin/domain/bloc/item_details_bloc.dart';
import 'package:admin/domain/bloc/item_list_bloc.dart';
import 'package:admin/domain/bloc/item_list_events.dart';
import 'package:admin/domain/model/item.dart';
import 'package:admin/domain/persistence/item_repository.dart';
import 'package:admin/domain/service/auth_service.dart';
import 'package:admin/domain/service/time_service.dart';
import 'package:admin/infra/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Dependencies {

  static List<RepositoryProvider> common() => [
    RepositoryProvider<TimeService>(create: (_) => TimeService()),
    RepositoryProvider<AuthService>(create: (context) => AuthService.of(context)),
    RepositoryProvider<ItemRepository>(create: (context) {
      final repository = ItemRepository.of(context);

      ["one", "two", "hundred"]
          .map(Item.from)
          .forEach(repository.save);

      return repository;
    }),
    RepositoryProvider<AppRouter>(create: (context) => AppRouter.of(context))
  ];

  static List<BlocProvider> blocs() => [
    BlocProvider<ItemListBloc>(create: (context) => ItemListBloc.of(context)
      ..add(ItemListRefreshed())
    ),
    const BlocProvider<ItemDetailsBloc>(create: ItemDetailsBloc.of),
  ];

  static List<RepositoryProvider> prod() => [
  ];

}
