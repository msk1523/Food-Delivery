import 'package:flutter/material.dart';
import 'package:food_delivery/service/gemini_service.dart';
import 'package:food_delivery/service/shared_pref.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String? name;
  GeminiService? _geminiService; // Make this nullable
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeSharedPref();
  }

  void _initializeSharedPref() async {
    name = await SharedPreferenceHelper().getUserName();
    _geminiService = GeminiService(
        userName: name ?? "User"); // Default to "User" if name is null
    setState(() {});
  }

  void _sendMessage() async {
    if (_geminiService == null) {
      _messages.add(ChatMessage(
          text: "Error: Service not initialized.", isUserMessage: false));
      setState(() {});
      return;
    }

    String message = _textController.text.trim();
    _textController.clear();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(text: message, isUserMessage: true));
        _isLoading = true;
      });
      try {
        final geminiResponse = await _geminiService!.sendMessage(message);
        setState(() {
          _messages.add(ChatMessage(
              text: geminiResponse ?? "Error occurred.", isUserMessage: false));
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _messages.add(ChatMessage(text: "Error: $e", isUserMessage: false));
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            // GestureDetector(
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            //   child: Icon(
            //     Icons.arrow_back_ios_new,
            //     color: Colors.black,
            //   ),
            // ),
            SizedBox(width: 30),
            Icon(Icons.fastfood, color: Colors.black),
            SizedBox(width: 10),
            Text('Your Padoswali Assistant',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _messages[index];
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(color: Colors.blue),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Enter your query (e.g., Order status)...',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.message, color: Colors.blue),
                      filled: true,
                      fillColor: Colors.orange[50],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUserMessage;

  ChatMessage({required this.text, required this.isUserMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isUserMessage ? Colors.blue[100] : Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUserMessage)
            Icon(Icons.fastfood, color: Colors.blue, size: 24),
          if (!isUserMessage) SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: isUserMessage ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
