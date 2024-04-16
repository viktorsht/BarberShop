class Api {
  static String urlApi = 'http://167.114.169.187:8000/api/v1/';
}

class RoutesApi{
  
  static String schedule = '${Api.urlApi}schedules';
  static String mySchedules = '${Api.urlApi}schedules/client';
  static String clients = '${Api.urlApi}clients';
  static String services = '${Api.urlApi}services';
  static String barbers = '${Api.urlApi}barbers';
  static String paymentMethods = '${Api.urlApi}paymentMethods';
  static String hoursActive = '${Api.urlApi}hoursActive';
  static String hours = '${Api.urlApi}hours';
  static String login = '${Api.urlApi}auth/login';
  static String refresh = '${Api.urlApi}refresh';
  static String createUser = '${Api.urlApi}auth/register';
  static String myUser = '${Api.urlApi}myUser';
  static String cities = '${Api.urlApi}cities';
  static String branches = '${Api.urlApi}branches';
  static String branchesForCity = '${Api.urlApi}branches?filter=city.id:=:';

}