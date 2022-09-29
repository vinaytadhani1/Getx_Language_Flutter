import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'nextpage.dart';

int? ggvalue = 0;

final List locales = [
    {
      'name':'English',
      'locale':const Locale('en','US'),
    },
    {
      'name':'عَمّان',
      'locale':const Locale('ar','OM'),
    }
  ];

class HomePage extends StatefulWidget {
const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  updateLocale(Locale locale , BuildContext context ){
    Get.updateLocale(locale);
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Text('language'.tr),
      ),
      body: SafeArea(
        child: 
        // Column(
        //   // crossAxisAlignment: CrossAxisAlignment.center,
        //   // mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Text('createYourAccount'.tr,style: TextStyle(fontSize: 20),),
        //     Text('otpVarification'.tr,style: TextStyle(fontSize: 20),),
        //     Text('phoneNumber'.tr,style: TextStyle(fontSize: 20),),
        //     SizedBox(height: 20,),
        //     CupertinoButton(
        //       child: Text('chanagelanguage'.tr), 
        //       onPressed: () => showLocaleDialog(context),
        //     ),
        //   ],
        // ),
        SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(15),
            child: Directionality(
              textDirection: ggvalue == 0 ? TextDirection.ltr : TextDirection.rtl,
              // textDirection: _selectedLang == 'en' ? TextDirection.ltr : TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('createYourAccount'.tr,style: const TextStyle(fontSize: 20),),
                  Text('otpVarification'.tr,style: const TextStyle(fontSize: 20),),
                  Text('phoneNumber'.tr,style: const TextStyle(fontSize: 20),),
                  const SizedBox(height: 15),
                  Container(
                    margin: const EdgeInsets.all(10),
                    height: MediaQuery.of(context).size.height/5,
                    // color: Colors.white,
                    child: ListView.separated(
                      itemCount: locales.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: ()async{
                            ggvalue = index;
                            updateLocale(locales[index]['locale'],context);
                            setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 15,right: 15),
                            alignment: Alignment.centerLeft,
                            height: 50, width:340,
                            // height: 50,width: 340,
                            decoration: BoxDecoration(
                              boxShadow:  [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: ggvalue == index ? Border.all( color: const Color(0xffF58823), width: 1.5): null,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children:  [
                                    Text(locales[index]['name'].toString(),
                                      // "Arabic",
                                      style: const TextStyle(
                                          fontSize: 17, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Radio<int>(
                                  value: index,
                                  groupValue:ggvalue,
                                  onChanged: (value) async {
                                    ggvalue = index;
                                    updateLocale(locales[index]['locale'],context);
                                    setState(() {});
                                  },
                                  activeColor: Colors.orange,
                                  fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                                    if (states.contains(MaterialState.selected)) {
                                      return Colors.orange;
                                    }
                                    return Colors.orange;
                                  }),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(height: 15),
                    ),
                  ),
                  SizedBox(height: 10),
                  CupertinoButton(
                    color: Colors.grey,
                    child: Text("Next"), 
                    onPressed: (){
                      Get.to(Nextpage());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}