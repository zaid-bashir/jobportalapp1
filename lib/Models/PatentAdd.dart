class AddPatent{
   String requestType;
   String  candidatepatentUuid;
   DateTime candidatepatentIssuedate;
   String candidatepatentApplicationnumber;
   String candidatepatentStatus;
   String candidatepatentOffice;
   String candidatepatentTitle;
   String candidatepatentDesc;
   String candidatepatentWeblink;

   AddPatent({this.requestType,this.candidatepatentUuid,this.candidatepatentIssuedate,this.candidatepatentApplicationnumber,this.candidatepatentStatus,
   this.candidatepatentOffice,this.candidatepatentTitle,this.candidatepatentDesc,this.candidatepatentWeblink});


   Map<String, dynamic> toJson() {
      return {
         "requestType": requestType,
         "candidatepatentUuid": candidatepatentUuid,
         "candidatepatentIssuedate":
         "${candidatepatentIssuedate.year.toString().padLeft(4, '0')}-${candidatepatentIssuedate.month.toString().padLeft(2, '0')}-${candidatepatentIssuedate.day.toString().padLeft(2, '0')}",
         "candidatepatentApplicationnumber": candidatepatentApplicationnumber,
         "candidatepatentStatus": candidatepatentStatus,
         "candidatepatentOffice": candidatepatentOffice,
         "candidatepatentTitle": candidatepatentTitle,
         "candidatepatentDesc": candidatepatentDesc,
         "candidatepatentWeblink": candidatepatentWeblink,
      };
   }
}