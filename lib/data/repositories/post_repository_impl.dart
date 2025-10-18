import 'package:flutter_clean_arch_example/data/datasources/post_remote_datasource.dart';
import 'package:flutter_clean_arch_example/domain/entities/post.dart';
import 'package:flutter_clean_arch_example/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource postRemoteDataSource;
  PostRepositoryImpl(this.postRemoteDataSource);
  @override
  Future<List<Post>> fetchPosts() async {
    return await postRemoteDataSource.fetchPosts();
  }
}
