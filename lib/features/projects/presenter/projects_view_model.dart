import 'package:flutter/cupertino.dart';
import 'package:website/core/api/response_wrapper.dart';
import 'package:website/features/projects/data/repository/github_repository_impl.dart';
import 'package:website/features/projects/domain/entities/repos_entity.dart';

class ProjectsViewModel extends ChangeNotifier {
  ProjectsViewModel() {
    fetchData();
  }

  final GithubRepositoryImpl _repository = GithubRepositoryImpl();

  bool isLoading = false;
  List<ReposEntity> projects = [];

  Future<void> fetchData() async {
    isLoading = true;
    ResponseWrapper response = await _repository.getRepos();
    if (response is SuccessWrapper) {
      final data = response.data as List;
      projects = data.map((e) => ReposEntity.mapper(e as Map<String, dynamic>)).toList();
    }
    isLoading = false;
    notifyListeners();
  }

}