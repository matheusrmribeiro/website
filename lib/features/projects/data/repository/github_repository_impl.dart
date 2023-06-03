import 'package:flutter_modular/flutter_modular.dart';
import 'package:website/core/api/api_client.dart';
import 'package:website/core/api/response_wrapper.dart';
import 'package:website/features/projects/domain/repository/github_repository_interface.dart';

class GithubRepositoryImpl extends GithubRepositoryInterface {

  final api = Modular.get<APIClient>();

  @override
  Future<ResponseWrapper> getRepos() async {
    return api.request(type: RequestType.get, path: "/repos");
  }
  
}