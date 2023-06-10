// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class SwitchState extends Equatable {
  final int bottomNavigationBarIndex;
  final String teg;
  const SwitchState({
    this.bottomNavigationBarIndex = 0,
    this.teg = "Все меню",
  });

  @override
  List<Object?> get props => [
        teg,
        bottomNavigationBarIndex,
      ];
}
