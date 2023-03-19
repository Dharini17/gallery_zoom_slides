import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';

class GalleryView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body:  gallery_zoom_slides(
          arrayImages:  [

      "https://i.ibb.co/bFx0p10/7.jpg",
      "https://i.ibb.co/SPwd6rJ/8.jpg",
      "https://i.ibb.co/GP2GFTG/6.jpg",
      "https://i.ibb.co/s3JYgx1/5.jpg",
          ],
          currentIndex: 3
      )

    );
  }
}