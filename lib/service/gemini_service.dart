import 'package:food_delivery/widget/app_constant.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  final String _apiKey;
  final GenerativeModel _model;
  final List<String> _foodDeliveryKeywords = [
    "order",
    "menu",
    "food",
    "delivery",
    "restaurant",
    "tracking",
    "payment",
    "support",
    "refund",
    "cuisine"
  ];
  final String userName;

  GeminiService({required this.userName})
      : _apiKey = "AIzaSyB8I22mTsbrsRSLW_-DX0Cxny-wZQv7XZs",
        _model = GenerativeModel(
          model: 'gemini-2.0-flash-exp',
          apiKey: apiKey, // Use from environment
          generationConfig: GenerationConfig(
            temperature: 1,
            topK: 40,
            topP: 0.95,
            maxOutputTokens: 8192,
            responseMimeType: 'text/plain',
          ),
        );

  Future<String?> sendMessage(String message) async {
    if (_apiKey.isEmpty) {
      throw Exception("API key not found");
    }

    // Check if the message is related to food delivery
    if (!_isFoodDeliveryQuery(message)) {
      return "I'm here to assist with food delivery-related queries. Please ask about orders, menus, delivery tracking, or related topics.";
    }

    // Add a system-level instruction as a prompt
    final String prompt = """
You are a chatbot for a food delivery app. Respond only to food delivery-related questions. Be concise with your answers. Do not ask order number, but ask other related queries to order and food delivery-related questions.
""";

    final String greeting =
        "Hello $userName! How can I assist you with your food delivery needs today?";

    try {
      final chat = _model.startChat();
      final content = Content.text("$greeting\n$prompt\nUser: $message");
      final response = await chat.sendMessage(content);
      return response.text;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  bool _isFoodDeliveryQuery(String message) {
    return _foodDeliveryKeywords.any(
        (keyword) => message.toLowerCase().contains(keyword.toLowerCase()));
  }
}
