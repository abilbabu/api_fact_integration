import 'dart:convert';

FactsModel factsModelFromJson(String str) =>
    FactsModel.fromJson(json.decode(str));

class FactsModel {
  num? currentPage;
  List<Facts>? factslist;
  String? firstPageUrl;
  num? from;
  num? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  num? perPage;
  dynamic prevPageUrl;
  num? to;
  num? total;

  FactsModel({
    this.currentPage,
    this.factslist,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory FactsModel.fromJson(Map<String, dynamic> json) => FactsModel(
        currentPage: json["current_page"],
        factslist: json["data"] == null
            ? []
            : List<Facts>.from(json["data"]!.map((x) => Facts.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );
}

class Facts {
  String? fact;
  num? length;

  Facts({
    this.fact,
    this.length,
  });

  factory Facts.fromJson(Map<String, dynamic> json) => Facts(
        fact: json["fact"],
        length: json["length"],
      );
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );
}
