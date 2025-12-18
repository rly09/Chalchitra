abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'An error occurred while fetching data.']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Please check your internet connection.']);
}

class EmptyFailure extends Failure {
  const EmptyFailure([super.message = 'No recommendations found.']);
}
