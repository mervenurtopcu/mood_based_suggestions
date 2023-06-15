import 'package:equatable/equatable.dart';

class NavStates extends Equatable {
  final int index;
  final bool isLoading;
  const NavStates({this.index = 0, this.isLoading = false});

  NavStates copyWith({int? index, bool? isLoading}) {
    return NavStates(
        index: index ?? this.index, isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [index, isLoading];
}