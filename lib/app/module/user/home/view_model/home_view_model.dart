

import 'package:example_30_may_24/app/module/user/home/model/home_model.dart';
import 'package:example_30_may_24/app/module/user/home/repository/home_repository.dart';
import 'package:example_30_may_24/data/response/status.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final jokeList = HomeModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setJokeList(HomeModel value) => jokeList.value = value;
  void setError(String value) => error.value = value;


  void jokeListApi() {
    setRxRequestStatus(Status.LOADING);
    _api.getData().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setJokeList(value);
    }).onError((error, stackTrace) {
      setRxRequestStatus(Status.ERROR);
    });
  }

}
