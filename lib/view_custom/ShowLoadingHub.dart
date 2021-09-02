
import 'BaseView.dart';

class ShowLoadingHud{
  static ShowLoadingHud _instance = new ShowLoadingHud._internal();

  ShowLoadingHud._internal();

  factory ShowLoadingHud(){
    _instance = _instance??new ShowLoadingHud._internal();
    return _instance;
  }

  showLoadingHud()async{
    BaseView.showLoading = true;
    if(!(BaseViewState.stream?.isClosed??true)) {
      BaseViewState.stream!.add(true);
      Future.delayed(Duration(milliseconds: 10000), (){
        if(BaseView.showLoading){
          dismissLoadingHud();
        }
      });
    }
  }

  dismissLoadingHud(){
    BaseView.showLoading = false;
    if(!(BaseViewState.stream?.isClosed??true)) {
      BaseViewState.stream!.add(false);
    }
  }

}
