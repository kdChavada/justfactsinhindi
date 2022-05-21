import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:justfactsinhindi/UI/data.dart';
import 'package:justfactsinhindi/UI/sub_category_list_view.dart';
import 'package:justfactsinhindi/constant.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
double h  = MediaQuery.of(context).size.height;
double w  = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          "Just Facts",
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
          ListView.builder(
            itemCount: homeData.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewFacts(
                                    nameOfTitle: '${homeData[i]['category']}')));

                        print(homeData[i]['category']);

                        categoryName = homeData[i]['category'];

                      },
                      child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5),
                          ),
                          child: Image.asset(homeData[i]['image'])),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
