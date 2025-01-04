import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/home/sura_details.dart';
import 'package:project/home/tabs/quran_tabDetails/suraItem.dart';
import 'package:project/home/tabs/quran_tabDetails/suraItem_horizontial.dart';
import '../../../appcolors.dart';
import '../../../models/sura_model.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText='';
  void addSuraList(){
    for(int i=0;i<114;i++){
      SuraModel.suraList.add(SuraModel(
          nameEn: SuraModel.suraNamesEn[i],
          nameAr: SuraModel.suraNamesAr[i],
          fileName: '${i+1}.txt',
          numOfVerses: SuraModel.suraVerseCounts[i]));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraList();

  }
  List<SuraModel>filterList=SuraModel.suraList;
  var searchController = TextEditingController();
  // onSearch() {
  //   SuraModel.searchResult.clear();
  //   String text = searchController.text;
  //   if (text.isNotEmpty) {
  //     for (String data in SuraModel.suraNamesEn) {
  //       if (data.toLowerCase().contains(text.toLowerCase())) {
  //         SuraModel.searchResult.add(data);
  //       }
  //     }
  //   }
  //   setState(() {});
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset("assets/images/onboarding_header.png"),
          _searchItem(),

          if (!(SuraModel.searchResult.isNotEmpty ||
              searchController.text.isNotEmpty)) ...[
            _suraNamesHorizontalList(),
          ],
            _suraNamesVerticalList(),
        ],
      ),
    );
  }
  Widget _searchItem() {
    return Column(
      children: [
        TextField(
          style: GoogleFonts.elMessiri(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          controller: searchController,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: "Sura Name",
            prefixIcon: const ImageIcon(
              AssetImage("assets/images/ic_pre_search.png"),
              color:AppColors.primaryColor,
            ),
            hintStyle: GoogleFonts.elMessiri(
                color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                const BorderSide(color: AppColors.primaryColor, width: 3)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide:
                const BorderSide(color: AppColors.primaryColor, width: 3)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 3),
            ),
          ),
          onChanged: (text){
            searchText=text;
            filterList=SuraModel.suraList.where((SuraModel){
              return SuraModel.nameAr.toLowerCase().contains(searchText.toLowerCase())||SuraModel.nameEn.toLowerCase().contains(searchText.toLowerCase());
            }).toList();
            setState(() {

            });
          },
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
  Widget _suraNamesHorizontalList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Most Recently",
          style: GoogleFonts.elMessiri(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        const SizedBox(
          height: 8,
        ),
        SuraModel.searchResult.isNotEmpty
            ? const SizedBox()
            : SizedBox(
          height: 150,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 16,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return SuraitemHorizontial(

                model: SuraModel.suraList[index],
              );
            },
            itemCount: SuraModel.listCounts,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
  Widget _suraNamesVerticalList() {

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Suras List",
            style: GoogleFonts.elMessiri(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                endIndent: 40,
                indent: 40,
              ),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                        arguments:filterList[index] );
                  },
                  child: SuraItem(
                    index: index,
                  model:filterList[index]
                  ) );
              },
              itemCount:filterList.length

            ),
          ),
        ],
      ),
    );
  }
}
