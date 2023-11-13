import 'package:bloc/bloc.dart';
import 'package:capstone_project_villa/data/datasources/remote/home_remote_datasource.dart';
import 'package:capstone_project_villa/data/models/response/home_response_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeGetUserEvent>((event, emit) async {
      emit(HomeLoading());
      final result = await HomeDataSource().getUser();
      result.fold((error) => emit(HomeError(message: error)),
          (success) => emit(HomeLoaded(user: success)));
    });
  }
}
