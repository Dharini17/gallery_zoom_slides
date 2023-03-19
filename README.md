## gallery_zoom_slides

Image zoomin & zoomout functionality

## Features

- pan gesture
- pinch zoomin & zoomout
- double tap zoomin - zoomout

<table>
   <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/gallery_zoom_slides/master/assets/1.png">
      </td>   
        <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/gallery_zoom_slides/master/assets/2.png">
      </td>        
    </tr> 
</table>

## Installation

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  gallery_zoom_slides: <latest_version>
```


## Usage

```dart

import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';

            body:  gallery_zoom_slides(
                    arrayImages:  [
                    
                    "https://i.ibb.co/bFx0p10/7.jpg",
                    "https://i.ibb.co/SPwd6rJ/8.jpg",
                    "https://i.ibb.co/GP2GFTG/6.jpg",
                    "https://i.ibb.co/s3JYgx1/5.jpg",
                    ],
                     currentIndex: 2
            )
        ...


```

## Additional information

Images used for example is just for a demo purpose.
