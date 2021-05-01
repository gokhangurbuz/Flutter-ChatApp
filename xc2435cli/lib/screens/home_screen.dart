import 'package:flutter/material.dart';
import 'package:xc2435cli/models/message_model.dart';
import 'package:xc2435cli/screens/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(
          "Inbox",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(itemCount: chats.length, itemBuilder: (BuildContext context, int index){
        final Message message = chats[index];
        return GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder:(_) => ChatScreen(user:message.sender))),
                  child: Container( 
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: message.unread ? BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                        //shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ]) :
                        BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ]),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(message.sender.imageUrl),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      padding: EdgeInsets.only(
                        left: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text(message.sender.name, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    message.sender.isOnline 
                                    ? Container(margin: const EdgeInsets.only(left: 5), width: 7, height: 7, decoration: BoxDecoration(shape: BoxShape.circle,color: Theme.of(context).primaryColor),)
                                    : Container(child: null,)
                                  ],
                                ),
                                 Text(message.time, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300,color: Colors.black54),)
                              ]),
                              SizedBox(height: 20,),
                              Container(alignment: Alignment.topLeft, child: Text(message.text,style: TextStyle(fontSize: 13, color:Colors.black54),
                              overflow: TextOverflow.ellipsis,maxLines: 2,),)
                        ],
                      )),
                ],
              ),
            ),
        );
      })
    );
  }
}
