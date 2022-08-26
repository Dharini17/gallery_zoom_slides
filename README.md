<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A Flutter plugin which gives you image functions like zoomin,zoomout,pinch,scale on double tap.

## Installation

 To start using this package, add gallery_zoom_slides dependency to your pubspec.yaml

```dependencies:
           gallery_zoom_slides: ^0.0.1
```

## Usage

Just add GalleryZoomSlides(arrayImages,0) into body of your Class

```
List<String> arrayImages =
     ["https://images.pexels.com/photos/60597/dahlia-red-blossom-bloom-60597.jpeg",
       "https://www.gardeningknowhow.com/wp-content/uploads/2019/09/flower-color-400x391.jpg"
     ];

...

     body: GalleryZoomSlides(arrayImages,0);

```
![Screenshot_20220826-230935](https://user-images.githubusercontent.com/20676701/186964105-d2718d55-d632-4cf0-b1ad-116738366166.png)



