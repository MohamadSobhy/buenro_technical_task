class ApiResource {
  //* Search API namespace
  static const String _search = "search";

  //* API Endpoints
  static String searchHotelsEndpoint({
    required String query,
    required String checkInDate,
    required String checkOutDate,
    int numberOfAdults = 1,
  }) {
    return "$_search?q=$query&check_in_date=$checkInDate&check_out_date=$checkOutDate&adults=$numberOfAdults";
  }
}
