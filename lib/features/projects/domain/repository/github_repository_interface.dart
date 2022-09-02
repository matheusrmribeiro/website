import 'package:website/core/api/response_wrapper.dart';

abstract class GithubRepositoryInterface {

  Future<ResponseWrapper> getRepos();

}