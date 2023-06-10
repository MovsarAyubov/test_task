import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'screen_manager_state.dart';

class ScreenManagerCubit extends Cubit<ScreenManagerState> {
  ScreenManagerCubit() : super(ScreenManagerInitial());
}
