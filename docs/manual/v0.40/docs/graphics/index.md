# Graphics

Provides graphics operations, such as for drawing pixels and images on the
screen.

`TODO: axis`

## Configuration

### GRAPHICS_SET_ANCHOR

Changes the drawing anchor of all subsequent drawing operations
[`GRAPHICS_DRAW_BMP`](#graphics_draw_bmp),
[`GRAPHICS_DRAW_RECT`](#graphics_draw_rect), and
[`GRAPHICS_DRAW_TEXT`](#graphics_draw_text).

```ceu
output (HAnchor,VAnchor) GRAPHICS_SET_ANCHOR;
```
- Parameters:
    - `HAnchor`: new horizontal anchor
    - `VAnchor`: new vertical anchor

The anchor specifies the part of the shape to appear at the pixel position of
the drawing operation.

The possible values for `HAnchor` are `HANCHOR_LEFT`, `HANCHOR_CENTER`,
and `HANCHOR_RIGHT`.
The initial value is `HANCHOR_CENTER`.

The possible values for `VAnchor` are `VANCHOR_TOP`, `VANCHOR_CENTER`,
and `VANCHOR_BOTTOM`.
The initial value is `VANCHOR_CENTER`.

### GRAPHICS_SET_BMP_FRAME

Changes the drawing frame of all subsequent
[`GRAPHICS_DRAW_BMP`](#graphics_draw_bmp) operations.

```ceu
output (int?,int?) GRAPHICS_SET_BMP_FRAME;
```
- Parameters:
    - `int?`: new frame index to show (default: `0`)
    - `int?`: new number of frames in the image (default: `1`)

The initial frame index is `0` and number of frames is `1`.

### GRAPHICS_SET_BMP_SIZE

Changes the drawing size of all subsequent
[`GRAPHICS_DRAW_BMP`](#graphics_draw_bmp) operations.

```ceu
output (int?,int?) GRAPHICS_SET_BMP_SIZE;
```
- Parameters:
    - `int?`: new width (default: proportional to new height)
    - `int?`: new height (default: proportional to new width)

If both width and height are set to default, the new size is the original image
size.

The initial size is the original image size.

### GRAPHICS_SET_COLOR_NAME

Changes the color of all subsequent drawing operations.

```ceu
output (Color) GRAPHICS_SET_COLOR_NAME
```

- Parameters:
    - `Color`: new color name

The color names are based on the *HTML Web Colors*:

<https://en.wikipedia.org/wiki/Web_colors#HTML_color_names>

The possible values are
    `COLOR_WHITE`,
    `COLOR_SILVER`,
    `COLOR_GRAY`,
    `COLOR_BLACK`,
    `COLOR_RED`,
    `COLOR_MAROON`,
    `COLOR_YELLOW`,
    `COLOR_OLIVE`,
    `COLOR_LIME`,
    `COLOR_GREEN`,
    `COLOR_AQUA`,
    `COLOR_TEAL`,
    `COLOR_BLUE`,
    `COLOR_NAVY`,
    `COLOR_FUCHSIA`,
    `COLOR_PURPLE`.

The initial color is white.

### GRAPHICS_SET_COLOR_RGB

Changes the color in RGB of all subsequent drawing operations.

```ceu
output (integer,integer,integer) GRAPHICS_SET_COLOR_RGB
```

- Parameters:
    - `integer`: new red component
    - `integer`: new green component
    - `integer`: new blue component

The initial color is white.

### GRAPHICS_SET_FONT

Changes the font for drawing and writing text.

```ceu
output (text,integer) GRAPHICS_SET_FONT
```

- Parameters:
    - `text`: path for the `.ttf` font filename
    - `integer`: height of the new font in pixels

### GRAPHICS_SET_SCALE

Changes the drawing scale of all subsequent drawing operations
[`GRAPHICS_DRAW_BMP`](#graphics_draw_bmp),
[`GRAPHICS_DRAW_RECT`](#graphics_draw_rect),
[`GRAPHICS_DRAW_TEXT`](#graphics_draw_text),
[`GRAPHICS_DRAW_INT`](#graphics_draw_int), and
[`GRAPHICS_DRAW_REAL`](#graphics_draw_real).

```ceu
output (real,real) GRAPHICS_SET_SCALE;
```
- Parameters:
    - `real`: new horizontal scale
    - `real`: new vertical scale

The initial scale is `1.0 x 1.0`.

### GRAPHICS_SET_WRITE_CURSOR

Changes the cursor starting position for writing text with
[`GRAPHICS_WRITE`](#graphics_write) and
[`GRAPHICS_WRITELN`](#graphics_writeln).

```ceu
output (integer,integer) GRAPHICS_SET_WRITE_CURSOR
```

- Parameters:
    - `integer`: new position in the `x-axis`
    - `integer`: new position in the `y-axis`

The initial starting position is the top-left of the screen.

The current position is reset on every
[`WINDOW_CLEAR`](../window/#window_clear) operation.

## Drawing

### GRAPHICS_DRAW_BMP

Draws a bitmap image on the screen.

```ceu
output (integer,integer,text) GRAPHICS_DRAW_BMP
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`
    - `text`: path for the `.bmp` image filename

### GRAPHICS_DRAW_PIXEL

Draws a pixel on the screen.

```ceu
output (integer,integer) GRAPHICS_DRAW_PIXEL
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`

The drawing color is specified with
[`GRAPHICS_SET_COLOR_NAME`](#graphics_set_color_name) or
[`GRAPHICS_SET_COLOR_RGB`](#graphics_set_color_rgb).

### GRAPHICS_DRAW_LINE

Draws a line on the screen.

```ceu
output (integer,integer,integer,integer) GRAPHICS_DRAW_LINE;
```

- Parameters:
    - `integer`: start position in the `x-axis`
    - `integer`: start position in the `y-axis`
    - `integer`: end position in the `x-axis`
    - `integer`: end position in the `y-axis`

The drawing color is specified with
[`GRAPHICS_SET_COLOR_NAME`](#graphics_set_color_name) or
[`GRAPHICS_SET_COLOR_RGB`](#graphics_set_color_rgb).

### GRAPHICS_DRAW_RECT

Draws a rectangle on the screen.

```ceu
output (integer,integer,integer,integer) GRAPHICS_DRAW_RECT
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`
    - `integer`: rectangle width
    - `integer`: rectangle height

The drawing color is specified with
[`GRAPHICS_SET_COLOR_NAME`](#graphics_set_color_name) or
[`GRAPHICS_SET_COLOR_RGB`](#graphics_set_color_rgb).

### GRAPHICS_DRAW_TEXT

Draws a text on the screen.

```ceu
output (int,int,text) GRAPHICS_DRAW_TEXT;
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`
    - `text`: text to draw

The drawing font is specified with [`GRAPHICS_SET_FONT`](#graphics_set_font).
The drawing color is specified with
[`GRAPHICS_SET_COLOR_NAME`](#graphics_set_color_name) or
[`GRAPHICS_SET_COLOR_RGB`](#graphics_set_color_rgb).

### GRAPHICS_DRAW_INT
Similar to [`GRAPHICS_DRAW_TEXT`](#graphics_draw_text), but draws a integer on the screen.

```ceu
output (int,int,int) GRAPHICS_DRAW_INT;
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`
    - `int`: int to draw

### GRAPHICS_DRAW_REAL
Similar to [`GRAPHICS_DRAW_REAL`](#graphics_draw_real), but draws a real on the screen.

```ceu
output (int,int,real) GRAPHICS_DRAW_REAL;
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`
    - `real`: real to draw    

## Writing

### GRAPHICS_WRITE

Writes a text on the screen.

```ceu
output (text) GRAPHICS_WRITE;
```

- Parameters:
    - `text`: text to draw

The drawing position is first specified with
[`GRAPHICS_SET_WRITE_CURSOR`](#graphics_set_text_cursor).
The cursor advances automatically for the position after the text.
The drawing font is specified with [`GRAPHICS_SET_FONT`](#graphics_set_font).
The drawing color is specified with
[`GRAPHICS_SET_COLOR_NAME`](#graphics_set_color_name) or
[`GRAPHICS_SET_COLOR_RGB`](#graphics_set_color_rgb).

### GRAPHICS_WRITELN

Writes a line of text on the screen.

```ceu
output (text) GRAPHICS_WRITELN;
```

The drawing position is first specified with
[`GRAPHICS_SET_WRITE_CURSOR`](#graphics_set_text_cursor).
The cursor advances automatically for the next line after the text, at the same
initial position.
The drawing font is specified with [`GRAPHICS_SET_FONT`](#graphics_set_font).
The drawing color is specified with
[`GRAPHICS_SET_COLOR_NAME`](#graphics_set_color_name) or
[`GRAPHICS_SET_COLOR_RGB`](#graphics_set_color_rgb).

## Other

### GRAPHICS_SCREENSHOT

Takes a screen shot.

```ceu
output (text) GRAPHICS_SCREENSHOT
```

- Parameters:
    - `text`: path for the `.bmp` image filename to generate
