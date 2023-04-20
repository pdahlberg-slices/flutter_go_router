
import 'package:admin/domain/bloc/item_details_events.dart';
import 'package:admin/domain/bloc/item_details_state.dart';
import 'package:admin/domain/model/item.dart';
import 'package:admin/domain/persistence/item_repository.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailsBloc extends Bloc<ItemDetailsEvent, ItemDetailsState> {

  final ItemRepository _itemRepository;

  ItemDetailsBloc(
      this._itemRepository,
  ) : super(ItemDetailsState.waiting()) {
    on<ItemAskedFor>(_onAskedFor);
  }

  ItemDetailsBloc.of(BuildContext context) : this(
    context.read(),
  );

  bool _stateSyncNeeded(int id) => state.item.id != id;

  Future<void> _onAskedFor(ItemAskedFor event, Emitter<ItemDetailsState> emit) async {
    if(_stateSyncNeeded(event.id)) {
      final item = /*await*/ _itemRepository.findById(event.id);

      debugPrint("AskedFor: ${event.id} => $item");

      if(item == null) {
        var errorMsg = "No item found for id: ${event.id}";
        //addError(errorMsg);
        emit(ItemDetailsState.error(errorMsg));
      } else {
        emit(ItemDetailsState(item: item));
      }
    }
  }

}
