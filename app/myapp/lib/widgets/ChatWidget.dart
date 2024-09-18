import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/Message.dart';

class ChatWidget extends StatefulWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  _ChatWidgetState createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _controller = TextEditingController();
  bool _isResponding = false;
  final List<Message> _messages = [];
  static const String _openaiApiKey =
      "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";

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return;

    print(_controller.text);

    final userMessage = _controller.text;
    setState(() {
      _messages.add(Message(true, userMessage));
      _isResponding = true;
    });
    _controller.clear();

    try {
      final response = await http.post(
        Uri.parse("https://api.openai.com/v1/chat/completions"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $_openaiApiKey"
        },
        body: jsonEncode({
          "model": "gpt-4o-mini",
          "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": userMessage}
          ]
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final aiMessage = jsonResponse['choices'][0]['message']['content'];
        setState(() {
          _messages.add(Message(false, aiMessage));
          _isResponding = false;
        });
      } else {
        throw Exception('Failed to load response');
      }
    } catch (e) {
      print('Error in _sendMessage: $e'); // In lỗi ra console
      setState(() {
        _isResponding = false;
        _messages.add(
            Message(false, "Error: Unable to get response. Please try again."));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            color: Colors.grey[200],
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return ListTile(
                  title: Align(
                    alignment: message.isSender
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            message.isSender ? Colors.blue[100] : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(message.msg),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        if (_isResponding)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("AI is typing...",
                style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
