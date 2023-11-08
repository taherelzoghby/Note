import 'package:bloc/bloc.dart';

class ObserverCubit extends BlocObserver{
  ///observe states
  @override
  void onChange(BlocBase bloc, Change change) {
    print(change);
    super.onChange(bloc, change);
  }
}