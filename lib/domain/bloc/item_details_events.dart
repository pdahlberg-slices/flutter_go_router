
import 'package:admin/domain/model/item.dart';
import 'package:equatable/equatable.dart';

abstract class ItemDetailsEvent extends Equatable {
  const ItemDetailsEvent();

  @override
  List<Object?> get props => [];
}

class ItemAskedFor extends ItemDetailsEvent {
  final int id;
  const ItemAskedFor(this.id);

  @override
  List<Object?> get props => [id];
}
