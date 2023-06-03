import 'package:flutter/cupertino.dart';
import 'package:website/core/api/response_wrapper.dart';
import 'package:website/core/base/base_view_model.dart';
import 'package:website/core/languages/language_utils.dart';
import 'package:website/core/widgets/toast.dart';
import 'package:website/features/projects/data/repository/github_repository_impl.dart';
import 'package:website/features/projects/domain/entities/repos_entity.dart';

class ProjectsViewModel extends BaseViewModel {
  ProjectsViewModel() {
    fetchData();
  }

  final GithubRepositoryImpl _repository = GithubRepositoryImpl();

  List<ReposEntity> projects = [];

  Future<void> fetchData() async {
    loadingStatus(true, message: LanguageUtils.getString("projects_loading"));
    ResponseWrapper response = await _repository.getRepos();
    if (response is SuccessWrapper) {
      final data = response.data as List;
      projects = data.map((e) => ReposEntity.mapper(e as Map<String, dynamic>)).toList();
    } else
      Toast.showMessage("projects_fail_to_load", toastKind: ToastKind.error);
    loadingStatus(false);
  }

}