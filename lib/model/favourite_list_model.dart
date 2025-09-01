import 'package:equatable/equatable.dart';

class FavouriteListModel extends Equatable {
  final String id;
  final String value;
  final bool isDeleting;
  final bool isFavourite;

  const FavouriteListModel({
    required this.id,
    required this.value,
    this.isDeleting = false,
    this.isFavourite = false,
  });

  FavouriteListModel copyWith({
    String? id,
    String? value,
    bool? isDeleting,
    bool? isFavourite,
  }) {
    return FavouriteListModel(
      id: id ?? this.id,
      value: value ?? this.value,
      isDeleting: isDeleting ?? this.isDeleting,
      isFavourite: isFavourite ?? this.isFavourite,
    );
  }

  @override
  List<Object?> get props => [id, value, isDeleting, isFavourite];
}
