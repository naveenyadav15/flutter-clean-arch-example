import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/post_remote_datasource.dart';
import 'data/repositories/post_repository_impl.dart';
import 'domain/usecases/get_posts.dart';
import 'presentation/posts/bloc/posts_bloc.dart';
import 'presentation/posts/pages/posts_page.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => PostRemoteDataSource(getIt()));
  getIt.registerLazySingleton(() => PostRepositoryImpl(getIt()));
  getIt.registerLazySingleton(() => GetPosts(getIt()));
  getIt.registerFactory(() => PostsBloc(getIt()));
}

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ElevatedButton(
                  child: const Text('Open Posts'),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) {
                          return BlocProvider(
                            create: (_) => getIt<PostsBloc>(),
                            child: PostsPage(),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
