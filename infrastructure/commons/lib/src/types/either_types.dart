import 'package:dependencies/fpdart.dart';

import '../errors/failure.dart';

typedef AsyncEither<T> = Future<Either<Failure, T>>;
typedef SyncEither<T> = Either<Failure, T>;
