
// import 'package:bumaco_aios/network/api_manager.dart';
// import 'package:bumaco_aios/ui/user/login_model.dart';
// import 'package:bumaco_aios/ui/user/user_add_model.dart';
// import 'package:bumaco_aios/ui/user/user_model.dart';

// class UserRepository {
//   final apiManager = ApiManager();

//   Future<LoginModel> onLoadLoginService(mobileNo, password) =>
//       apiManager.fetchLoginService(mobileNo, password);

//   Future<UserAddModel> onLoadUserInsertService(userRoll,userId,userName, mobileNo,  password,
//   email,address,city,state, postalCode,shopName,gstin) =>
//       apiManager.userInsertService(userRoll,userId,userName, mobileNo,  password,
//   email,address,city,state, postalCode,shopName,gstin);

//   Future<UserModel> onLoadUserListService() =>
//       apiManager.getUserList();

//   Future<UserModel> onLoadUserByIdService(id) =>
//       apiManager.fetchUserByIdService('user_mobile', id);

//   Future<UserModel> onLoadUserUpdateService(id) =>
//       apiManager.fetchUserUpdateService('user_mobile', id);
// }
