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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text(
          "Just Facts",
          style: GoogleFonts.abel(fontSize: 30.0),
        ),
      ),
      body: ListView.builder(
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
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
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
    );
  }
}
