import '../../core/enums/params_type.dart';

class PaginateReqEntity {
  final int page;
  final int perPage;
  final SortType sortType;

  PaginateReqEntity({
    this.page = 1,
    this.sortType = SortType.asc,
    this.perPage = 10,
  });
}
