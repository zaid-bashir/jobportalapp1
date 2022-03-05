class Boards{
  String  boardId;
  String  boardName;

  Boards({this.boardId,this.boardName});

  factory Boards.fromJson(Map<String,dynamic> item){
    return Boards(
        boardId: item["boardId"],
        boardName: item["boardName"]
    );
  }
}