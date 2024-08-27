import '../../model/general_model.dart';

class PageEntity<T extends GeneralModel> {
    int totalPage;
    int page;
    int itemCount;
    bool loading;
    bool paginateLoading;
   List<T>? data;

  PageEntity({this.totalPage=2, this.page=1, this.itemCount=0, this.loading=false,
      this.paginateLoading=false, this.data});

}
