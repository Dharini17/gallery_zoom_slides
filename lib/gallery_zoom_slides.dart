library gallery_zoom_slides;

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum ZoomTheme { theme1,theme2,theme3, theme4 }

class galleryZoomSlides extends StatelessWidget{

  List<String> arrayImages;
  final int selectedImagePosition;
  final Color selectedThumbnailColor;
  ZoomTheme zoomTheme;


  galleryZoomSlides({
    super.key,
    required this.arrayImages,
    this.selectedImagePosition = 0,
    this.selectedThumbnailColor = Colors.blueGrey,
    required this.zoomTheme,
  });

  ValueNotifier<int> currentPosition = ValueNotifier(0);

  final pageController = PageController();

  final _transformationController = TransformationController();
  TapDownDetails? _doubleTapDetails;

  void onPageChanged(int index) {
    currentPosition.value = index;
    currentPosition.notifyListeners();
    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    }
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {

    if (_transformationController.value != Matrix4.identity()) {
      _transformationController.value = Matrix4.identity();
    } else {
      final position = _doubleTapDetails!.localPosition;
      // For a 3x zoom
      _transformationController.value = Matrix4.identity()
        ..translate(-position.dx * 2, -position.dy * 2)
        ..scale(3.0);
      // Fox a 2x zoom
      // ..translate(-position.dx, -position.dy)
      // ..scale(2.0);
    }
  }

  Widget funcLoader(bool isLoaderDisplay){
    return Center(
      child : Visibility(

        visible: isLoaderDisplay,
        child: Container(

          height: 70,width: 70,

          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey.shade800),
            strokeWidth: 2.0,
          ),

        ),
      ),
    );
  }

  BoxDecoration funcCircularControlShadow({required double radius}){
    return BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow:  [
          BoxShadow(
            color: Colors.grey.withOpacity(0.50) ,
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: const Offset(0, 0.5), // changes position of shadow
          ),
        ],
        color: Colors.white
    );
  }

  Widget funcOverlay({required BuildContext context}){

    switch(zoomTheme){

      case ZoomTheme.theme1 :
        return  Column(
          children: [
            const Spacer(),
            Padding(padding: const EdgeInsets.only(bottom: 15),
                child:  ValueListenableBuilder(
                    valueListenable: currentPosition,
                    builder: (BuildContext context, currentPositionValue, child) {

                      return Row(

                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [

                          //left button
                          currentPositionValue == 0 ? const CircleAvatar( radius: 22, backgroundColor: Colors.transparent,) :
                          GestureDetector(
                              onTap: (){

                                if(currentPositionValue != 0) {
                                  currentPosition.value -= 1;
                                }
                                else{
                                  currentPosition.value = arrayImages.length-1;
                                }
                                currentPosition.notifyListeners();
                                pageController.animateToPage(currentPosition.value,duration: const Duration(milliseconds: 400),curve: Curves.linear);

                              },
                              child:
                              Container(
                                decoration: funcCircularControlShadow(radius: 25),
                                child:CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 18,
                                  child: Icon(Icons.arrow_back_ios_new_rounded,size: 16,color: Colors.grey.shade800,),
                                ),
                              )
                          ),
                          const SizedBox(width: 10,),
                          //close button
                          GestureDetector(
                            onTap: (){

                              Navigator.pop(context);

                            },
                            child:
                            Container(
                              decoration: funcCircularControlShadow(radius: 30),
                              child:
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: Icon(Icons.close,size: 18,color: Colors.grey.shade800,),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          //right button
                          currentPositionValue == arrayImages.length-1 ? const CircleAvatar( radius: 22, backgroundColor: Colors.transparent,) :
                          GestureDetector(
                            onTap: (){

                              if(currentPositionValue != arrayImages.length-1) {
                                currentPosition.value += 1;
                              }
                              else{
                                currentPosition.value = 0;
                              }
                              currentPosition.notifyListeners();
                              pageController.animateToPage(currentPosition.value,duration: const Duration(milliseconds: 400),curve: Curves.linear);

                            },
                            child:
                            Container(
                              decoration: funcCircularControlShadow(radius: 25),
                              child:
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 18,
                                child: Icon(Icons.arrow_forward_ios_rounded,size: 16,color: Colors.grey.shade800,),
                              ),
                            ),
                          ),

                        ],
                      );
                    })
            )
          ],
        );

      case ZoomTheme.theme2 :
        return Column(
          children: [


            Padding(
              padding: const EdgeInsets.only(top: 20,right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child:  Icon(Icons.close_rounded,size: 25,color: Colors.grey,),
                    )
                ),
              ),
            ),

            const Spacer(),

            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: SizedBox(height: 70,
                child: RawScrollbar(
                  controller: ScrollController(),
                  child: ListView.builder(
                    itemCount: arrayImages.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10,right: index == arrayImages.length-1 ? 10 : 0),
                        child: GestureDetector(
                          onTap: (){
                            currentPosition.value = index;
                            currentPosition.notifyListeners();
                            pageController.animateToPage(currentPosition.value,duration: const Duration(milliseconds: 400),curve: Curves.linear);
                          },
                          child: ValueListenableBuilder(
                              valueListenable: currentPosition,
                              builder: (BuildContext context, currentPositionValue, child) {

                                return Container(
                                  height: 70,width: 60,
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1 ,color: index == currentPositionValue ? selectedThumbnailColor : Colors.transparent)
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: arrayImages[index],
                                    placeholder: (context, url) => const Center(child: SizedBox(height: 45,width: 45,),),
                                    errorWidget: (context, url, error) => const  Icon(Icons.error),
                                  ),
                                );
                              }),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )

          ],
        );

      case ZoomTheme.theme3 :
        return Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 40,right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                    child: Container(
                      height: 35,width: 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35/2),
                          border: Border.all(color: Colors.grey,width: 0.5)
                      ),
                      alignment: Alignment.center,
                      child:  Icon(Icons.close_rounded,size: 20,color: Colors.black,),
                    )
                ),
              ),
            ),

            const Spacer(),
            Padding(padding: const EdgeInsets.only(bottom: 15),
                child:  Container(
                  width: 150,
                  // padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35/2),
                    // border: Border.all(color: Colors.grey,width: 1)
                  ),
                  child: ValueListenableBuilder(
                      valueListenable: currentPosition,
                      builder: (BuildContext context, currentPositionValue, child) {

                        return Row(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [

                            //left button
                            InkWell(
                              onTap: (){

                                if(currentPositionValue != 0) {
                                  currentPosition.value -= 1;
                                }
                                else{
                                  currentPosition.value = arrayImages.length-1;
                                }
                                currentPosition.notifyListeners();
                                pageController.animateToPage(currentPosition.value,duration: const Duration(milliseconds: 400),curve: Curves.linear);

                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Icon(Icons.arrow_back_ios_new_rounded,size: 16,color: Colors.grey.shade800,),
                              ),//currentPositionValue == 0 ? Colors.grey.shade500 :

                            ),
                            const SizedBox(width: 20,),
                            //close button
                            Text("${currentPosition.value+1}/${arrayImages.length}"),
                            const SizedBox(width: 20,),
                            //right button
                            //currentPositionValue == arrayImages.length-1 ? const CircleAvatar( radius: 22, backgroundColor: Colors.transparent,) :
                            InkWell(
                              onTap: (){

                                if(currentPositionValue != arrayImages.length-1) {
                                  currentPosition.value += 1;
                                }
                                else{
                                  currentPosition.value = 0;
                                }
                                currentPosition.notifyListeners();
                                pageController.animateToPage(currentPosition.value,duration: const Duration(milliseconds: 400),curve: Curves.linear);

                              },
                              child:Padding(
                                padding: const EdgeInsets.all(10),
                                child: Icon(Icons.arrow_forward_ios_rounded,size: 16,color:Colors.grey.shade800,),
                              ),//currentPositionValue == arrayImages.length-1 ? Colors.grey.shade500 :

                            ),

                          ],
                        );
                      }),
                )
            )

          ],
        );

      case ZoomTheme.theme4 :
        return Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 40,right: 20),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                    child: Container(
                      height: 35,width: 35,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35/2),
                          border: Border.all(color: Colors.grey,width: 0.5)
                      ),
                      alignment: Alignment.center,
                      child:  Icon(Icons.close_rounded,size: 20,color: Colors.black,),
                    )
                ),
              ),
            ),

            const Spacer(),
            Padding(padding: const EdgeInsets.only(bottom: 15),
                child: ValueListenableBuilder(
                      valueListenable: currentPosition,
                      builder: (BuildContext context, currentPositionValue, child) {

                        return DotsIndicator(
                          dotsCount: arrayImages.length,
                          position: int.parse("$currentPositionValue"),
                          decorator: DotsDecorator(
                            color: Colors.grey,
                            activeColor: selectedThumbnailColor,
                          ),
                        );
                      }),

            )

          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {

    currentPosition = ValueNotifier(selectedImagePosition);

    Future.delayed(const Duration(milliseconds: 3), () {

      pageController.jumpToPage(selectedImagePosition);

    });

    return  Scaffold(
      backgroundColor: Colors.white,
      body: Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child:  Stack(
            children: <Widget>[

              //page content
              Positioned.fill(
                child: PageView(
                    // physics:const NeverScrollableScrollPhysics(),
                    physics:const AlwaysScrollableScrollPhysics(),
                    controller: pageController,
                    onPageChanged: onPageChanged,
                    children:<Widget>[

                      for(int i=0;i<arrayImages.length;i++)

                        GestureDetector(
                          onDoubleTapDown: _handleDoubleTapDown,
                          onDoubleTap: _handleDoubleTap,

                          child:

                          InteractiveViewer(
                            transformationController: _transformationController,
                            minScale: 1.0,
                            maxScale: 3.0,
                            panEnabled: true,
                            scaleEnabled: true,
                            boundaryMargin: const EdgeInsets.all(100.0),
                            child:
                            CachedNetworkImage(
                              imageUrl: "${arrayImages[i]}",
                              placeholder: (context, url) => Center(child: Container(height: 45,width: 45,child: this.funcLoader(true),),),
                              errorWidget: (context, url, error) => new Icon(Icons.error),
                            ),
                          ),

                        )

                    ]
                ),
              ),

              Positioned.fill(
                child: funcOverlay(context: context),
              ),

            ],
          )

      ),
    );
  }
}
