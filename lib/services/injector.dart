//DI repo
import 'package:get_it/get_it.dart';
import 'package:vx_project/presentation/counter/counter_bloc/counter_bloc.dart';
import 'package:vx_project/data/api/counter_api.dart';
import 'package:vx_project/domain/counter/counter_repo.dart';
import 'package:vx_project/domain/counter/counter_repo_impl.dart';

final getIt = GetIt.I;
void setUpDI() {
  //Repos
  getIt.registerSingleton<CounterRepository>(
    CounterRepositoryImpl(
      counterApi: CounterApi(),
    ),
  );

  //Blocs
  getIt.registerFactory<CounterBloc>(() {
    final counterRepo = getIt.get<CounterRepository>();
    return CounterBloc(counterRepository: counterRepo);
  });
}

CounterRepository get counterRepo => getIt.get();
CounterBloc get counterBLoc => getIt.get();
