import 'package:bloc/bloc.dart';
import 'package:capstone_project_villa/data/datasources/remote/detail_remote_datasource.dart';
import 'package:capstone_project_villa/data/models/response/detail_response_model.dart';
import 'package:meta/meta.dart';

part 'detail_vila_event.dart';
part 'detail_vila_state.dart';

class DetailVilaBloc extends Bloc<DetailVilaEvent, DetailVilaState> {
  DetailVilaBloc() : super(DetailVilaInitial()) {
    on<GetDetailEvent>((event, emit) async {
      emit(DetailVilaLoading());
      final result = await DetailDataSource().getDetail(event.id);
      result.fold((error) => emit(DetailVilaError(message: error)),
          (success) => emit(DetailVilaLoaded(detail: success)));
    });
  }
}
