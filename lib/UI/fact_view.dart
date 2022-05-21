import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';

class CardView extends StatefulWidget {
  String nameOfTitle;

  CardView({Key? key, required this.nameOfTitle}) : super(key: key);

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  Future<void> getData() async {
    await dbHelper.databaseGet();
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          widget.nameOfTitle,
          style: GoogleFonts.abel(fontSize: 30.0),
        ),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
           physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(8.0),
            itemCount: dbHelper.homeCategory.length,
            itemBuilder: (context, i) {
              return AnimationConfiguration.staggeredList(
                position: i,
                duration: const Duration(seconds: 3),
                child: SlideAnimation(
                  verticalOffset: 44.0,
                  child: FadeInAnimation(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            showDialog(context: context, builder: (context){
                              return const AlertDialog(
                                  title: Icon(CupertinoIcons.share),
                              );
                            });

                          },
                          child: Card(
                            child: Container(
                                margin: const EdgeInsets.all(10),
                                width: w,
                                child: Text(
                                  "${dbHelper.homeCategory[i]['fact']}",
                                  style: GoogleFonts.abel(fontSize: 16.0),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 13.0,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
