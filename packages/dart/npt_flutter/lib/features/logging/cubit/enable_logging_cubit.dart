import 'package:flutter_bloc/flutter_bloc.dart';

class EnableLoggingCubit extends Cubit<bool> {
  EnableLoggingCubit() : super(true);

  void disable() => emit(false);
  void enable() => emit(true);
}
