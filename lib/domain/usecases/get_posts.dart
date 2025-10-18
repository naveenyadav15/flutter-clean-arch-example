import 'package:flutter_clean_arch_example/domain/repositories/post_repository.dart';

import '../entities/post.dart';

class GetPosts {
  final PostRepository postRepository;
  GetPosts(this.postRepository);

  Future<List<Post>> call() {
    return postRepository.fetchPosts();
  }
}
