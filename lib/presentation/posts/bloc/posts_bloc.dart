import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_posts.dart';
import 'posts_event.dart';
import 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetPosts getPosts;
  PostsBloc(this.getPosts) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async {
      emit(PostsLoading());
      try {
        final posts = await getPosts.call();
        emit(PostsLoaded(posts));
      } catch (e) {
        emit(PostsError(e.toString()));
      }
    });
  }
}
