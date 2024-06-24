import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? errorMessage;
  final int? status;
  final Map<String, dynamic>? tripCloseError;
  const Failure({this.errorMessage, this.status, this.tripCloseError});

  @override
  List<Object> get props => [];
}

class CaCheFailure extends Failure {
  const CaCheFailure({super.errorMessage, super.status});
}

class RequestCancelledFailure extends Failure {
  const RequestCancelledFailure({super.errorMessage, super.status});
}

class ServerFailure extends Failure {
  const ServerFailure({super.errorMessage, super.status});
}
