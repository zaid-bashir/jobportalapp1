class ApiResponse <T>{
 T data;
 bool error;
 String errorMessage;
 int responseCode;
 T errorResponse;

 ApiResponse({this.data,this.errorMessage,this.error = false,this.responseCode,this.errorResponse});
}
