## gallery_zoom_slides

Image zoomin & zoomout functionality

## Features

- pan gesture
- pinch zoomin & zoomout
- double tap zoomin - zoomout 


<table>
    <tr>
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/gallery_zoom_slides/master/assets/options.png">     
      </td>   
        <td></td>          
    </tr>    
   <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/gallery_zoom_slides/master/assets/theme1.png">
      </td>   
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/gallery_zoom_slides/master/assets/theme2.png">
      </td>        
    </tr>
 <tr>
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/gallery_zoom_slides/master/assets/theme3.png">     
      </td>   
        <td>
        <img width="250px" src="https://raw.githubusercontent.com/Dharini17/gallery_zoom_slides/master/assets/theme4.png"> 
</td>          
    </tr>  
</table>

## Installation

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  gallery_zoom_slides: 0.1.0
```


## Usage

```dart

            import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';
            
            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                    galleryZoomSlides(
                    
                        //required fields                 
                        arrayImages:  const [
                        "https://i.ibb.co/C78HbbR/xl-d-pista-oraganza-s-deklook-original-imags3a5bguzakgq.webp",
                        "https://i.ibb.co/jH1SBF4/xl-d-pista-oraganza-s-deklook-original-imags3a5kf7tngq8.webp",
                        "https://i.ibb.co/hZ0By5W/xl-d-pista-oraganza-s-deklook-original-imags3a5pjsfs98c.webp",
                        "https://i.ibb.co/Dt5qBV3/xl-d-pista-oraganza-s-deklook-original-imags3a5xd7ctjvt.webp"
                        ],
                        
                        //Optional fields
                        zoomTheme: ZoomTheme.theme2,//.theme1, .theme2, .theme3, .theme4
                        selectedImagePosition: 1,
                        selectedThumbnailColor: Colors.blue,
                    )
              )
            );
        ...


```

NOTE : Images taken only for demo purpose
