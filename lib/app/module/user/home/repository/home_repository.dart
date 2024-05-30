
import 'package:example_30_may_24/app/module/user/home/model/home_model.dart';
import 'package:example_30_may_24/core/resources/app_urls.dart';
import 'package:example_30_may_24/data/network/network_api_services.dart';

class HomeRepository {

  final _apiService  = NetworkApiServices() ;

  Future<HomeModel> getData() async{
    dynamic response = await _apiService.getApi(AppUrls.jokeSampleApi);
    return HomeModel.fromJson(response) ;
  }

}