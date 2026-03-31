import 'package:new_exp_flut/core/networking/api_service.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../models/sign_up_request_body.dart';
import '../models/sign_up_response.dart';

class SignupRepo{
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(SignupRequestBody signupRequestBody) async {
    try{
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    }catch (error){
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}