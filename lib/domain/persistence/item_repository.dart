import 'package:admin/domain/model/item.dart';
import 'package:admin/domain/service/time_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemRepository {

  final TimeService _timeService;
  final Map<int, Item> db;

  ItemRepository(
    this._timeService,
  ) : db = {};

  ItemRepository.of(BuildContext context) : this(
    context.read(),
  );

  Item save(Item item) {
    final toSave = item.id > 0 ? item : item.copyWith(
      id: item.name.hashCode,
      timestamp: _timeService.nowMillis(),
    );

    return db[toSave.id] = toSave;
  }

  Item? findById(int id) {
    for (var value in db.values) {
      debugPrint(value.toString());
    }
    return db[id];
  }

  List<Item> findAll() {
    return db.values.toList();
  }
}