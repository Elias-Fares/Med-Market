enum ParamsType { withPaginate, sortBy, sort, page, perPage }

extension ParamsTypeExtension on ParamsType {
  getType() {
    switch (this) {
      case ParamsType.withPaginate:
        return 'with_paginate';
      case ParamsType.sortBy:
        return 'sort_by';
      case ParamsType.sort:
        return 'sort';
      case ParamsType.page:
        return 'page';
      case ParamsType.perPage:
        return 'per_page';
    }
  }
}

enum PaginateType { yes, no }

extension PaginateTypeExtension on PaginateType {
  getType() {
    switch (this) {
      case PaginateType.yes:
        return '${ParamsType.withPaginate.getType()}=yes';
      case PaginateType.no:
        return '${ParamsType.withPaginate.getType()}=no';
    }
  }
}


enum SortType {asc, dsc}

extension SortTypeExtension on SortType {
  getType() {
    switch (this) {
      case SortType.asc:
        return '${ParamsType.sort.getType()}=asc';
      case SortType.dsc:
        return '${ParamsType.sort.getType()}=desc';
    }
  }
}