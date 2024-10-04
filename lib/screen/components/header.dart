import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,50,20,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Rized Chat",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),),
          Icon(Icons.search_sharp,size: 30,)
        ],
      ),
    );
  }
}

