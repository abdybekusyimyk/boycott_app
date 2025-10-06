import 'package:boycott_app/app/app.dart';
import 'package:boycott_app/constants/api/api_const.dart';
import 'package:boycott_app/data/home/repositories/home_repo_impl.dart';
import 'package:boycott_app/data/home/repositories/home_repository.dart';
import 'package:boycott_app/data/home/sources/home_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);

  final dio = Dio(BaseOptions(baseUrl: ApiConst.baseLink));

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepositoryImpl(dataSource: HomeRemoteDataSource(dio)),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
