import 'package:flutter/material.dart';
import 'package:projectsmax/Home/widget/image_slider.dart';
import 'package:projectsmax/practice_model/prac_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentSlider = 0;
  List<dynamic> names = [
    'usman',
    'noman',
    'faraz',
    'ali',
    'jamal',
    'kamal',
    'kaif',
    'saif'
  ];
  @override
  Widget build(BuildContext context) {
    // List<dynamic> names = [
    //   'usman',
    //   'noman',
    //   'faraz',
    //   'ali',
    //   'jamal',
    //   'kamal',
    //   'kaif',
    //   'saif'
    // ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // for image slider
              SizedBox(
                height: 10,
              ),
              Text('check2g'),

              SizedBox(
                height: 20,
              ),
              ImageSlider(
                  onChange: (value) {
                    setState(() {
                      currentSlider = value;
                    });
                  },
                  currentSlide: currentSlider),
              SizedBox(
                height: 10,
              ),
              categoryItems(),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: pract.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        
                        decoration: BoxDecoration(
                          
                            image: DecorationImage(
                              
                                image: AssetImage(pract[index].image),),
                                   color: Colors.blue,),
                                                       

                                
                      ),
                      SizedBox(height: 15,),
                      Text(pract[index].title, style: TextStyle(color: Colors.black,fontSize: 33),)
                  
                    ],
                  );
                },
              ),
              // // grid
              // SizedBox(
              //   height: 10,
              // ),
              // GridView.builder(
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2,
              //     ),
              //     itemCount: names.length,
              //     itemBuilder: (context, index) {
              //       return Container();
              // Container(
              //   height: 50,
              //   width: 50,
              //   decoration: BoxDecoration(color: Colors.red),
              // );
              // })
            ],
          ),
        ),
      ),
    );
  }

  SizedBox categoryItems() {
    return SizedBox(
        height: 150,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: names.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    // child: Text(names.toString()),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(names[index])
                ],
              );
            }));
  }
}
