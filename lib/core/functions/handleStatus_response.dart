import '../class/status_request.dart';

//check for data from server,
handleStatus(response){
  if(response is StatusRequest){
    return response;
  }else{
    return StatusRequest.success;
  }
}