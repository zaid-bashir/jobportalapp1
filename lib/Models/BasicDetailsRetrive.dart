class BasicDetailsProfile{
 String candidateId;
 String candidateName;
 String candidateCode;
 String candidateMobile1;
 String candidateMobile2;
 String candidateEmail1;
 String candidateEmail2;
 String candidateAddress1;

 BasicDetailsProfile({this.candidateId,this.candidateName,this.candidateCode,this.candidateMobile1,this.candidateMobile2,this.candidateEmail1,
 this.candidateEmail2,this.candidateAddress1});

 factory BasicDetailsProfile.formJson(Map<String,dynamic>item){
   return BasicDetailsProfile(
     candidateId: item["candidateId"],
     candidateName: item["candidateName"],
     candidateCode: item["candidateCode"],
     candidateMobile1: item["candidateMobile1"],
     candidateMobile2: item["candidateMobile2"],
     candidateEmail1: item["candidateEmail1"],
     candidateEmail2: item["candidateEmail2"],
     candidateAddress1: item["candidateAddress1"],
   );
 }
}