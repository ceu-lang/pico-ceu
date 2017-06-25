# Graphics

Provides graphics operations, such as for drawing pixels and images on the
screen.

`TODO: axis, anchor, etc`

## Configuration

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

The default color is white.

### GRAPHICS_SET_COLOR_RGB

Changes the color in RGB of all subsequent drawing operations.

```ceu
output (integer,integer,integer) GRAPHICS_SET_COLOR_RGB
```

- Parameters:
    - `integer`: new red component
    - `integer`: new green component
    - `integer`: new blue component

The default color is white.

### GRAPHICS_SET_GRID

Enables or disables a visual grid delimiting the screen pixels.

```ceu
output (yesno) GRAPHICS_SET_GRID
```

- Parameters:
    - `yesno`: new state
        - `yes`: enables the grid
        - `no`: disables the grid

The ratio between the real and logical dimensions set with
[`WINDOW_SET_SIZE`](../window/#window_set_size) must be greater then one.

### GRAPHICS_SET_FONT

Changes the font for drawing and writing text.

```ceu
output (text,integer) GRAPHICS_SET_FONT
```

- Parameters:
    - `text`: path for the `.ttf` font filename
    - `integer`: height of the new font in pixels

### GRAPHICS_SET_WRITE_CURSOR

Changes the cursor position for writing text with [`GRAPHICS_WRITE`](#graphics_write) and
[`GRAPHICS_WRITELN`](#graphics_writeln).

```ceu
output (integer,integer) GRAPHICS_SET_WRITE_CURSOR
```

- Parameters:
    - `integer`: new position in the `x-axis`
    - `integer`: new position in the `y-axis`

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
