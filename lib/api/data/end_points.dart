String baseUrl = "http://172.23.78.131:3000/";

abstract class EndPoints {
  // Authentication
  static String sendOTP = "api/v1/auth/sendOTP";
  static String verifyOTP = "api/v1/auth/verifyOTP";
  static String registerUser = "api/v1/auth/register";
  static String loginUser = "api/v1/auth/login";
  static String liveAuction = "api/v1/auction/live";
  static String upcomingAuction = "api/v1/auction/upcoming";



// Messages
  static String sendMessage = "api/v1/chat/send";
  static String messagedProfiles = "api/v1/chat/profiles";
  static String conversation = "api/v1/chat/conversation";

  static String bid = "api/v1/bids";



}
