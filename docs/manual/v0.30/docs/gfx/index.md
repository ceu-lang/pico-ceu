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

### GFX_SET_RGB

Changes the color of all subsequent drawing operations.

```ceu
output (integer,integer,integer) GFX_SET_RGB
```

- Parameters:
    - `integer`: new red component
    - `integer`: new green component
    - `integer`: new blue component

### GFX_SET_TEXT_CURSOR

Changes the cursor position for drawing text.

```ceu
output (integer,integer) GFX_SET_TEXT_CURSOR
```

- Parameters:
    - `integer`: new position in the `x-axis`
    - `integer`: new position in the `y-axis`

### GFX_SET_TEXT_FONT

Changes the font for drawing text.

```ceu
output (text,integer) GFX_SET_TEXT_FONT
```

- Parameters:
    - `text`: path for the `.ttf` font filename
    - `integer`: height of the new font in pixels

## Drawing Operations

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
output (text,integer,integer) GFX_DRAW_BMP
```

- Parameters:
    - `text`: path for the `.bmp` image filename
    - `integer`: drawing position in the `x-axis`
    - `integer`: drawing position in the `y-axis`

### GFX_DRAW_PIXEL

Draws a pixel on the screen.

```ceu
output (integer,integer) GFX_DRAW_PIXEL
```

- Parameters:
    - `integer`: drawing position in the `x-axis`
    - `integer`: drawing position in the `y-axis`

The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

### GFX_DRAW_RECT

Draws a rectangle on the screen.

```ceu
output (integer,integer,integer,integer) GFX_DRAW_RECT
```

- Parameters:
    - `integer`: drawing position in the `x-axis`
    - `integer`: drawing position in the `y-axis`
    - `integer`: rectangle width
    - `integer`: rectangle height

The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

### GFX_DRAW_TEXT

Draws a text on the screen.

```ceu
output (text) GFX_DRAW_TEXT
```

- Parameters:
    - `text`: text to draw

The drawing position is first specified with
[`GFX_SET_TEXT_CURSOR`](#gfx_set_text_cursor).
The cursor advances automatically for the position after the text.
The drawing font is specified with [`GFX_SET_TEXT_FONT`](#gfx_set_text_font).
The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

### GFX_DRAW_TEXTLN

Draws a line of text on the screen.

```ceu
output (text) GFX_DRAW_TEXTLN
```

The drawing position is first specified with
[`GFX_SET_TEXT_CURSOR`](#gfx_set_text_cursor).
The cursor advances automatically for the next line after the text, at the same
initial position.
The drawing font is specified with [`GFX_SET_TEXT_FONT`](#gfx_set_text_font).
The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

## Other

### GFX_SCREENSHOT

Takes a screen shot.

```ceu
output (text) GFX_SCREENSHOT
```

- Parameters:
    - `text`: path for the `.bmp` image filename to generate
