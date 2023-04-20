
import 'package:admin/domain/bloc/result_base_state.dart';
import 'package:admin/domain/model/item.dart';
import 'package:flutter/cupertino.dart';

class ItemDetailsState extends ResultBaseState {

  const ItemDetailsState({
    required this.item,
    String? errorMsg,
  }) : super(errorMsg);

  ItemDetailsState.waiting() : this(item: Item.empty());
  ItemDetailsState.error(String msg) : this(item: Item.empty(), errorMsg: msg);

  final Item item;

  ItemDetailsState copyWith({
    Item? item,
    ValueGetter<String?>? errorMsg,
  }) {
    return ItemDetailsState(
      item: item ?? this.item,
      errorMsg: errorMsg != null ? errorMsg() : super.errorMsg,
    );
  }

  @override
  List<Object?> get props => [item, isOk];

}

