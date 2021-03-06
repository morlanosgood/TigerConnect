import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class FriendlyChat extends StatefulWidget {

  @override
  FriendlyChatState createState() => new FriendlyChatState();
}

class FriendlyChatState extends State<FriendlyChat> with TickerProviderStateMixin {

  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  @override
  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }
  void _handleSubmitted(String something) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: something,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 300),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return
    new Column(
      children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )
        ),
        new Divider(height: 1.0,),
        new Container(
          decoration: new BoxDecoration(
              color: Theme.of(context).cardColor
          ),
          child: _buildTextComposer(),
        )
      ],
    );
  }

  Widget _buildTextComposer() {

    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    controller: _textController,
                    onChanged: (String text)  {
                      setState(()  {
                        _isComposing = text.length > 0;
                      });
                    },
                    onSubmitted: _handleSubmitted,
                    decoration: new InputDecoration.collapsed(
                        hintText: "Send a message"),
                    maxLines: 5,
                  ),
                ),
                new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: Theme.of(context).platform == TargetPlatform.iOS ?
                  new CupertinoButton(
                    child: new Text("Send"),
                    onPressed: _isComposing
                        ? () =>  _handleSubmitted(_textController.text)
                        : null,) :
                  new IconButton(
                    icon: new Icon(Icons.send),
                    onPressed: _isComposing ?
                        () => _handleSubmitted(_textController.text) :
                    null,

                  ),
                ),
              ]
          ),
        )
    );
  }
}

@override
class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;

  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    const String _name = "Edwin";

    var checkedString = _checkString();

    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
            parent: animationController,
            curve: Curves.easeOut
        ),
        axisAlignment: 0.0,

        child: new Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              new Container(
                margin: const EdgeInsets.only(right: 16.0),
                child: new CircleAvatar(child: new Text(_name[0])),
              ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: <Widget>[
                  new Text(_name, style: Theme.of(context).textTheme.subhead),

                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(checkedString),
                  ),
                ],
              ),
            ],
          ),
        )
    );
  }

  String _checkString() {

    var magicNum = 30;
    var loopTimes = (text.length/magicNum).toInt();
    var tempString = "";
    int start = 0;
    int endChar = magicNum;


    if (loopTimes < 1)
      return text;

    else {
      for (int i = 0; i < loopTimes; i++) {

        tempString += text.substring(start, endChar) + "\n";

        start = start + magicNum;
        endChar = endChar + magicNum;

      }
      tempString += text.substring(start, text.length);
      return tempString;
    }
  }
}