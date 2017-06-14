# Graphics

Provides graphics operations, such as for drawing pixels and images on the
screen.

## Configuration

### GFX_SET_GRID

Enables or disables a visual grid delimiting the screen pixels.

```ceu
output (yesno) GFX_SET_GRID
```

- Parameters:
    - `yesno`: new state
        - `yes`: enables the grid
        - `no`: disables the grid

The ratio between the real and logical dimensions set with
[`WINDOW_SET_SIZE`](../window/#window_set_size) must be greater then one.

### GFX_SET_FONT

Changes the font for drawing and writing text.

```ceu
output (text,integer) GFX_SET_FONT
```

- Parameters:
    - `text`: path for the `.ttf` font filename
    - `integer`: height of the new font in pixels

### GFX_SET_RGB

Changes the color of all subsequent drawing operations.

```ceu
output (integer,integer,integer) GFX_SET_RGB
```

- Parameters:
    - `integer`: new red component
    - `integer`: new green component
    - `integer`: new blue component

### GFX_SET_WRITE_CURSOR

Changes the cursor position for writing text with [`GFX_WRITE`](#gfx_write) and
[`GFX_WRITELN`](#gfx_writeln).

```ceu
output (integer,integer) GFX_SET_WRITE_CURSOR
```

- Parameters:
    - `integer`: new position in the `x-axis`
    - `integer`: new position in the `y-axis`

## Drawing

### GFX_CLEAR

Clears the screen.

```ceu
output (none) GFX_CLEAR
```

- Parameters:
    - `none`: no parameters

The clear color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

### GFX_DRAW_BMP

Draws a bitmap image on the screen.

```ceu
output (integer,integer,text) GFX_DRAW_BMP
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`
    - `text`: path for the `.bmp` image filename

### GFX_DRAW_PIXEL

Draws a pixel on the screen.

```ceu
output (integer,integer) GFX_DRAW_PIXEL
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`

The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

### GFX_DRAW_LINE

Draws a line on the screen.

```ceu
output (integer,integer,integer,integer) GFX_DRAW_LINE;
```

- Parameters:
    - `integer`: start position in the `x-axis`
    - `integer`: start position in the `y-axis`
    - `integer`: end position in the `x-axis`
    - `integer`: end position in the `y-axis`

The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

### GFX_DRAW_RECT

Draws a rectangle on the screen.

```ceu
output (integer,integer,integer,integer) GFX_DRAW_RECT
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`
    - `integer`: rectangle width
    - `integer`: rectangle height

The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

### GFX_DRAW_TEXT

Draws a text on the screen.

```ceu
output (int,int,text) GFX_DRAW_TEXT;
```

- Parameters:
    - `integer`: position in the `x-axis`
    - `integer`: position in the `y-axis`
    - `text`: text to draw

The drawing font is specified with [`GFX_SET_FONT`](#gfx_set_font).
The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

## Writing

### GFX_WRITE

Writes a text on the screen.

```ceu
output (text) GFX_WRITE;
```

- Parameters:
    - `text`: text to draw

The drawing position is first specified with
[`GFX_SET_WRITE_CURSOR`](#gfx_set_text_cursor).
The cursor advances automatically for the position after the text.
The drawing font is specified with [`GFX_SET_FONT`](#gfx_set_font).
The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

### GFX_WRITELN

Writes a line of text on the screen.

```ceu
output (text) GFX_WRITELN;
```

The drawing position is first specified with
[`GFX_SET_WRITE_CURSOR`](#gfx_set_text_cursor).
The cursor advances automatically for the next line after the text, at the same
initial position.
The drawing font is specified with [`GFX_SET_FONT`](#gfx_set_font).
The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

## Other

### GFX_SCREENSHOT

Takes a screen shot.

```ceu
output (text) GFX_SCREENSHOT
```

- Parameters:
    - `text`: path for the `.bmp` image filename to generate
