class DummyApiService {
  Future<String> fetchWelcomeMessage() async {
    await Future.delayed(const Duration(seconds: 1));
    return "Welcome to your College App!";
  }
}
