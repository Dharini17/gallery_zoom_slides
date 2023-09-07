## gallery_zoom_slides

Image zoomin & zoomout functionality

## Features

- pan gesture
- pinch zoomin & zoomout
- double tap zoomin - zoomout 


<table>
    <tr>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/gallery_zoom_slides/master/assets/pinch.png">     
    </tr>
    
   <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/gallery_zoom_slides/master/assets/theme1.png">
      </td>   
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/gallery_zoom_slides/master/assets/theme2.png">
      </td>        
    </tr> 
</table>

## Installation

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  gallery_zoom_slides: 0.0.5
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
                        zoomTheme: ZoomTheme.theme2,
                        selectedImagePosition: 1,
                        selectedThumbnailColor: Colors.blue,
                    )
              )
            );
        ...


```

## Additional information

Images used for example is just for a demo purpose.
