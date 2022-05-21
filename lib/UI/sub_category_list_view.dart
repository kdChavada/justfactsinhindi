import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justfactsinhindi/UI/fact_view.dart';
import 'package:justfactsinhindi/constant.dart';

import '../main.dart';

class ViewFacts extends StatefulWidget {
  String nameOfTitle;

  ViewFacts({Key? key, required this.nameOfTitle}) : super(key: key);

  @override
  State<ViewFacts> createState() => _ViewFactsState();
}

class _ViewFactsState extends State<ViewFacts> {
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
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          widget.nameOfTitle,
          style: GoogleFonts.indieFlower(fontSize: 30.0),
        ),
      ),
      body: Stack(
        children: [
          Image.asset('assets/images/bghhh.jpg',
            height: h,
            width: w,
            fit: BoxFit.cover,
          ),
          AnimationLimiter(
            child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: dbHelper.category.length,
                itemBuilder: (context, i) {
                  return AnimationConfiguration.staggeredList(
                    position: i,
                    duration: const Duration(seconds: 2),
                    child: SlideAnimation(
                      verticalOffset: 44.0,
                      child: FadeInAnimation(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>  CardView(nameOfTitle: '${dbHelper.category[i]['sub_cate']}',)));
                                fact = '${dbHelper.category[i]['sub_cate']}';
                                },
                              child: Container(
                                height: h * 0.1,
                                width: w,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(

                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(5),
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5),
                                    ),
                                  border: Border.all(
                                  width: 5,
                                    color: Colors.orange,
                                  )
                                ),
                                child: Center(
                                  child: Text(
                                    "${dbHelper.category[i]['sub_cate']}",
                                    style: GoogleFonts.rajdhani(
                                      fontSize: 30.0,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),

                        const    SizedBox(height: 13.0,),

                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
