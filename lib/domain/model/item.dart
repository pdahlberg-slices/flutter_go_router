
import 'package:equatable/equatable.dart';

class Item extends Equatable {

  final int id;
  final String name;
  final int timestamp;

  Item(this.id, this.name, this.timestamp);
  Item.from(String name) : this(0, name, 0);

  Item.empty() : this(0, "", 0);

  Item copyWith({
    int? id,
    String? name,
    int? timestamp,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      timestamp ?? this.timestamp,
    );
  }

  @override
  String toString() {
    return 'Item{id: $id, name: $name}';
  }

  @override
  List<Object?> get props => [id, name];
}