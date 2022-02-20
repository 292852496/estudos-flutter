import 'package:equatable/equatable.dart';
import 'package:flutterando/models/cep_model.dart';

abstract class SearchCepState {}

class SearchCepStart implements SearchCepState {}

class SearchCepLoading implements SearchCepState {}

class SearchCepError implements SearchCepState {
  String message;

  SearchCepError(this.message);
}

class SearchCepSuccess extends Equatable implements SearchCepState {
  final CepModel data;

  const SearchCepSuccess(this.data);

  @override
  List<Object?> get props => [data];
}
