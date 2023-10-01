import 'package:flutter/material.dart';

class WallPost extends StatelessWidget {
  final String message;
  final String user;
  //final String time;
  const WallPost({
    super.key,
    required  this.message,
    required  this.user,
    //required  this.time,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      margin: const EdgeInsets.only(top: 25, left: 25),
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          // profile pic
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400]
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(Icons.person,
               color: Colors.white,
            ),
          ),
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user, style: TextStyle(color: Colors.grey[500]),
              
              ),
                 const SizedBox(height: 10,),
              Text(message),
            ],
          )
        ],
      ),
    );
  }
}