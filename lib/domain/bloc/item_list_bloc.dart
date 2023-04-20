
import 'package:admin/domain/bloc/item_list_events.dart';
import 'package:admin/domain/bloc/item_list_state.dart';
import 'package:admin/domain/model/item.dart';
import 'package:admin/domain/persistence/item_repository.dart';
import 'package:admin/domain/service/time_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemListBloc extends Bloc<ItemListEvent, ItemListState> {

  final TimeService _timeService;
  final ItemRepository _itemRepository;

  ItemListBloc(
      this._timeService,
      this._itemRepository,
  ) : super(const ItemListState()) {
    on<ItemListRefreshed>(_onRefresh);
    on<ItemAdded>(_onAdd);
  }

  ItemListBloc.of(BuildContext context) : this(
    context.read(),
    context.read(),
  );
  
  Future<void> _onRefresh(ItemListRefreshed event, Emitter<ItemListState> emit) async {
    emit(state.copyWith(items: _itemRepository.findAll()));
  }

  Future<void> _onAdd(ItemAdded event, Emitter<ItemListState> emit) async {
    var nowMillis = _timeService.nowMillis();
    final newItem = Item(nowMillis, event.name, nowMillis);

    emit(state.copyWith(
        items: [
          ...state.items,
          newItem,
        ],
    ));
  }

}
