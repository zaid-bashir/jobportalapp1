class ApiResponse <T>{
 T data;
 bool error;
 String errorMessage;
 int responseCode;

 ApiResponse({this.data,this.errorMessage,this.error = false,this.responseCode});
}
