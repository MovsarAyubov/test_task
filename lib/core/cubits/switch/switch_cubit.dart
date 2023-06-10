import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'switch_state.dart';

@LazySingleton()
class SwitchCubit extends Cubit<SwitchState> {
  SwitchCubit() : super(const SwitchState());

  bool tegIsApplied(String teg) => state.teg == teg ? true : false;

  void setTeg(String teg) {
    emit(SwitchState(
        teg: teg, bottomNavigationBarIndex: state.bottomNavigationBarIndex));
  }

  void switchPage(int index) {
    emit(SwitchState(teg: state.teg, bottomNavigationBarIndex: index));
  }
}
