import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:habba20/pages/screens/event_list.dart';
import 'package:habba20/widgets/transparent_chip.dart';

class EventCatagoryCard extends StatelessWidget {
  //EventCatagory cat;
  DocumentSnapshot docSnap;
  String name;
  String img;

  //CallbackAction call;

  EventCatagoryCard({this.name = '', this.img = '', this.docSnap});


  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(right: 10.0, left: 10.0, top: 8),
      // width: 150.0,
      //height: MediaQuery.of(context).size.height,
      decoration: new BoxDecoration(
        //color: color,
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(10.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
              color: Colors.black38,
              blurRadius: 2.0,
              spreadRadius: 1.0,
              offset: new Offset(0.0, 1.0)),
        ],
        //gradient:
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EventList(cat_name: name, img: img,)));
        },
        child: DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 10.0, // has the effect of softening the shadow
                spreadRadius: 0.0, // has the effect of extending the shadow
                offset: Offset(
                  0.0, // horizontal, move right 10
                  5.0, // vertical, move down 10
                ),
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
                Center(child: background(context) //background(),
                    ),
                new Container(
                  alignment: Alignment.center,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: TransparentChip(
                    label: name.replaceAll('\\n', '\n').trim(),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget background(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: CachedNetworkImage(
        imageUrl: img,
        fit: BoxFit.cover,
      ),
    );
  }
}
