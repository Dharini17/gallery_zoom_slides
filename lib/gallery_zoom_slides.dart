library gallery_zoom_slides;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class gallery_zoom_slides extends StatelessWidget{

  List<String> arrayImages;
  int currentIndex;


  gallery_zoom_slides({required this.arrayImages,required this.currentIndex});

  final pageController = PageController();

  final _transformationController = TransformationController();
  TapDownDetails? _doubleTapDetails;


  void onPageChanged(int index) {
    currentIndex = index;
  }

  void _handleDoubleTapDown(TapDownDetails details) {
    _doubleTapDetails = details;
  }

  void _handleDoubleTap() {

    print("double tap clicked");

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

                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Colors.grey.shade800),
                      strokeWidth: 2.0,
                    ),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    ValueNotifier<int> currIndex = ValueNotifier(currentIndex);

    Future.delayed(const Duration(milliseconds: 3), () {

      pageController.jumpToPage(currentIndex);

    });

    return  Scaffold(
        backgroundColor: Colors.white,
      body: Container(

          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          child:  Stack(
            children: <Widget>[

              //page content
              Positioned(
                top: 0,left: 0,bottom: 0,right: 0,

                child: PageView(
                    physics:new NeverScrollableScrollPhysics(),
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
                            boundaryMargin: EdgeInsets.all(100.0),

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

              //bottom row
              Positioned(

                left: 0,right: 0,bottom: 10,
                child:
                ValueListenableBuilder(
                    valueListenable: currIndex,
                    builder: (BuildContext context, currIndexValue, child) {

                        return Row(

                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [

                            //left button
                            currIndexValue == 0 ? const CircleAvatar( radius: 22, backgroundColor: Colors.transparent,) :
                            GestureDetector(
                                onTap: (){

                                  if(currIndexValue != 0) {
                                    currIndex.value -= 1;
                                  }
                                  else{
                                    currIndex.value = arrayImages.length-1;
                                  }
                                  currIndex.notifyListeners();
                                  pageController.animateToPage(currIndex.value,duration: const Duration(milliseconds: 400),curve: Curves.linear);

                                },
                                child:
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25.0),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0, 1), // changes position of shadow
                                        ),
                                      ],
                                      color: Colors.white
                                  ),
                                  child:CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 22,
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 1), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white
                                ),
                                child:
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 27,
                                  child: Icon(Icons.close,size: 18,color: Colors.grey.shade800,),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            //right button
                            currIndexValue == arrayImages.length-1 ? const CircleAvatar( radius: 22, backgroundColor: Colors.transparent,) :
                            GestureDetector(
                              onTap: (){

                                if(currIndexValue != arrayImages.length-1) {
                                  currIndex.value += 1;
                                }
                                else{
                                  currIndex.value = 0;
                                }
                                currIndex.notifyListeners();
                                pageController.animateToPage(currIndex.value,duration: const Duration(milliseconds: 400),curve: Curves.linear);

                              },
                              child:
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(0, 1), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white
                                ),
                                child:
                                CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 22,
                                  child: Icon(Icons.arrow_forward_ios_rounded,size: 16,color: Colors.grey.shade800,),
                                ),
                              ),
                            ),

                          ],
                        );
                    })

              ),

            ],
          )

      ),
    );
  }

}