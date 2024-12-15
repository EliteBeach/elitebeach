class Api {
  //base Url
  static const String mainAppUrl = "https://freefare.app/";
  //end points
  static const String baseUrl = "${mainAppUrl}api/";
  static const String doServerLoginApiCall = "auth/login";
  static const String doServerRefreshTokenApiCall = "auth/refreshToken";

  static const String doServerAddUserApiCall = "auth/add_user";
  static const String doServerCheckExistUserApiCall = "auth/checkExiteUser";
  static const String doServerChangePasswordApiCall = "auth/update_password/";
  static const String doServerCheckUserNameApiCall = "auth/checkExiteUsername";
  static const String doServerCheckPhoneApiCall = "auth/checkExitePhone";
  static const String doServerCheckEmailApiCall = "auth/checkExiteEmail";
  static const String doServerCheckPlateNumberApiCall =
      "auth/checkExitePlateNumber";
  static const String doServerCarBrandApiCall = "carbrand_new";
  static const String doServerGetCityApiCall = "getcity_new";
  static const String doServerGetUsersListApiCall = "get_user_list";
  static const String doServerAddGroupApiCall = "add_groub";
  static const String doServerAddGroup2ApiCall = "add_groub_2";

  static const String doServerUserGroupsApiCall = "get_users_Groubs";
  static const String doServerUserRequestApiCall = "get_users_requests";
  static const String doServerGroupDetailsApiCall = "get_one_Groubs";
  static const String doServerGroupTypeApiCall = "groub_type";
  static const String doServerAcceptRequestApiCall = "accept_request";
  static const String doServerRefuseRequestApiCall = "refuse_request";
  static const String doServerDeleteGroupMemberApiCall = "delete_users_2";
  static const String doServerAddGroupMemberApiCall = "add_users_2";
  static const String doServerEditGroupApiCall = "edit_groub";
  static const String doServerAddTripApiCall = "add_trips";
  static const String doServerUserTripsApiCall = "get_my_trips";
  static const String doServerTripDetailsApiCall = "get_trip_data";
  static const String doServerFindTripApiCall = "search_trip";
  static const String doServerJoinTripRequestApiCall = "trip_join_request/";
  static const String doServerAcceptTripRequestApiCall = "accept_request_trip";
  static const String doServerRefuseTripRequestApiCall = "refuse_request_trip";
  static const String doServerUserTripsRequestApiCall = "get_user_trips";
  static const String doServerOwnerTripsTodayApiCall = "get_my_trips_today";
  static const String doServerOwnerTripsTodayDetailsApiCall =
      "get_trip_day_data";
  static const String doServerStartTripApiCall = "admin_record_start";
  static const String doServerRiderTripsTodayApiCall = "get_user_trips_today";
  static const String doServerRiderConfirmTripApiCall = "user_confirm_trip";
  static const String doServerRiderTripActionApiCall = "user_record_confirm";
  static const String doServerRefreshUserDataApiCall = "auth/user-profile";
  static const String doServerKiloShareHistoryApiCall =
      "user_transaction_history/";
  static const String doServerUserNotificationsApiCall =
      "get_user_notifications";
  static const String doServerDonateKiloShareApiCall = "transform_kiloshare";
  static const String doServerEndTripApiCall = "end_trip";
  static const String doServerInvitationTypesApiCall = "get_type_invitations";
  static const String doServerSendInvitationApiCall = "send_invitation";
  static const String doServerGetUserInvitationsApiCall = "user_invitation/";
  static const String doServerInvitationActionApiCall = "replay_invitation";
  static const String doServerGroupTripsApiCall = "get_gruop_trips";
  static const String doServerReadNotificationsApiCall =
      "update_notification_read";
  static const String doServerGetSentInvitationsApiCall = "my_invitation/";
  static const String doServerCancelInvitationApiCall = "cancel_invitation/";

  //Maps Calls
  //-Search places (Suggestions)
  static const String kMapsApiKey = 'AIzaSyBByAzw6JxgWe0OC4JOFQY9gv7JIp5Mbo4';
  static String doServerSearchPlacesApiCall =
      'https://maps.googleapis.com/maps/api/place/autocomplete/json';
  //place details
  static String doServerPlaceDetailsApiCall =
      'https://maps.googleapis.com/maps/api/place/details/json';
  //place directions
  static String doServerPlaceDirectionsApiCall =
      'https://maps.googleapis.com/maps/api/directions/json';
  //Geocoding
  static String doServerGeocodingApiCall =
      'https://maps.googleapis.com/maps/api/geocode/json';
}
