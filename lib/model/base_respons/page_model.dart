import 'dart:convert';

class PageModel {
  int? currentPage;
  List<dynamic>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  int? to;
  int? total;

  PageModel(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.to,
        this.total});

  PageModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    data =  json['data'];
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['data'] = this.data;
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}



class PaginationModel {
    final List<dynamic>? data;
    final List<dynamic>? v1;
    final Pagination? pagination;

    PaginationModel({
        this.data,
        this.v1,
        this.pagination,
    });

    PaginationModel copyWith({
        List<dynamic>? data,
        List<dynamic>? v1,
        Pagination? pagination,
    }) => 
        PaginationModel(
            data: data ?? this.data,
            v1: v1 ?? this.v1,
            pagination: pagination ?? this.pagination,
        );

    factory PaginationModel.fromRawJson(String str) => PaginationModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PaginationModel.fromJson(Map<String, dynamic> json) => PaginationModel(
        data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
        v1: json["v1"] == null ? [] : List<dynamic>.from(json["v1"]!.map((x) => x)),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
        "v1": v1 == null ? [] : List<dynamic>.from(v1!.map((x) => x)),
        "pagination": pagination?.toJson(),
    };
}

class Pagination {
    final int? page;
    final int? limit;
    final int? totalpage;

    Pagination({
        this.page,
        this.limit,
        this.totalpage,
    });

    Pagination copyWith({
        int? page,
        int? limit,
        int? totalpage,
    }) => 
        Pagination(
            page: page ?? this.page,
            limit: limit ?? this.limit,
            totalpage: totalpage ?? this.totalpage,
        );

    factory Pagination.fromRawJson(String str) => Pagination.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        limit: json["limit"],
        totalpage: json["totalpage"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "totalpage": totalpage,
    };
}

