import 'package:flutter/material.dart';
import 'package:project/api/api_manager.dart';
import 'package:project/appcolors.dart';
import 'package:project/home/tabs/radio_tab/radio_screen.dart';
import 'package:project/models/RadioResponse.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    bool  onClick=false;
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset("assets/images/onboarding_header.png"),
          const SizedBox(height: 10),

          // Custom pill-shaped TabBar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.blackColor, // inactive bg
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  color: AppColors.primaryColor, // active bg
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withOpacity(0.4),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                labelColor: AppColors.primaryDarkColor,
                unselectedLabelColor: AppColors.whiteColor,
                labelStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.bold),
                unselectedLabelStyle: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontWeight: FontWeight.w300),
                indicatorSize: TabBarIndicatorSize.tab, // full width of each tab
                tabs: const [
                  Tab(text: "Radio"),
                  Tab(text: "Reciters"),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Tab content
          Expanded(
            child: TabBarView(
              children: [
                // Radio list with smooth scrolling
                FutureBuilder<RadioResponse>(future:ApiManager.getRadioData() ,


                    builder:(context, snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return const Expanded(child: Center(child: CircularProgressIndicator( color: AppColors.primaryColor,)));
                  }
                  else if(snapshot.hasError){
                    return Column(
                      children: [
                        const Text("Some Thing Went Wrong"),
                        ElevatedButton(onPressed: (){
                          setState(() {
                            ApiManager.getRadioData();
                          });
                        }, child:
                        const Text("Try Again")
                        ),
                      ],
                    );
                  }

                  else{
                    RadioResponse data=snapshot.data!;
                    return   ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  separatorBuilder: (context, index) =>
                   const SizedBox(height: 16),
                     itemBuilder: (context, index) {
                      return RecordScreen(height: height,
                        name: data.radios![index].name??"",
                        url: data.radios![index].url??"",);
                    },
                    itemCount:data.radios!.length,
                 );
                  }
                    }, ),


                // Reciters list with smooth scrolling
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        title: Text(
                          "Reciter ${index + 1}",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        trailing: IconButton(
                          onPressed: (){
                            setState(() {
                              !onClick;
                            });
                          },
                          icon: onClick==true?Icon(
                            Icons.stop_circle_rounded,
                            color: AppColors.primaryColor,
                          ):Icon(
                            Icons.play_circle_fill,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
