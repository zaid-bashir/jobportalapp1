class ResearchpaperAdd {
  String requestType;
  String candidatepaperUuid;
  String candidatepaperTitle;
  String candidatepaperWeblink;
  String candidatepaperDesc;
  String candidatepaperPublisheddate
  ;

  ResearchpaperAdd({
    this.requestType,
    this.candidatepaperUuid,
    this.candidatepaperTitle,
    this.candidatepaperWeblink,
    this.candidatepaperDesc,
    this.candidatepaperPublisheddate,
  });

  factory ResearchpaperAdd.fromJson(Map<String, dynamic>item){
    return  ResearchpaperAdd(
      requestType: item["requestType"],
      candidatepaperUuid: item["candidatepaperUuid"],
      candidatepaperTitle: item["candidatepaperTitle"],
      candidatepaperWeblink: item["candidatepaperWeblink"],
      candidatepaperDesc: item["candidatepaperDesc"],
      candidatepaperPublisheddate: item["candidatepaperPublisheddate"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "requestType": requestType,
      "candidatepaperUuid": candidatepaperUuid,
      "candidatepaperTitle": candidatepaperTitle,
      "candidatepaperWeblink": candidatepaperWeblink,
      "candidatepaperDesc": candidatepaperDesc,
      "candidatepaperPublisheddate": candidatepaperPublisheddate
    };
  }
}
