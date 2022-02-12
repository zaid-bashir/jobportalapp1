class Streams{
  String streamId;
  String streamName;

  Streams({this.streamId,this.streamName});

  factory Streams.fromJson(Map<String,dynamic>item){
    return Streams(
      streamId: item["streamId"],
      streamName: item["streamName"]
    );
  }
}