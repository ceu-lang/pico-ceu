# Data Types

pico-Céu already provides some data types 

## Color

```
data Color with
    var integer r;
    var integer g;
    var integer b;
end
```

- Parameters:
    - `integer`: red component
    - `integer`: green component
    - `integer`: blue component

Example:
```
var Color color = val Color(255,1,1);
emit GRAPHICS_SET_COLOR_NAME(color);
emit GRAPHICS_DRAW_PIXEL(0,0);
emit GRAPHICS_SET_COLOR_RGB(color.r, color.g, color.b);
emit GRAPHICS_DRAW_PIXEL(1,1);
```


## Point

```
data Point with
    var integer x;
    var integer y;
end
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`


Example:
```
var Point pt = val Point(0,0);
emit GRAPHICS_DRAW_PIXEL(pt.x, pt.y);
```

## Rect

```
data Rect with
    var integer x;
    var integer y;
    var integer w;
    var integer h;
end
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`
    - `integer`: rectangle width
    - `integer`: rectangle height


Example:
```
var Rect rect = val Rect(0,0,4,5);
emit GRAPHICS_DRAW_RECT(rect.x, rect.y, rect.w, rect.h);
```