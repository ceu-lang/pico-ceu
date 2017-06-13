# Graphics

Provides graphics operations, such as for drawing pixels and images on the
screen.

## Configuration

### GFX_SET_GRID

Enables or disables a visual grid delimiting the screen pixels.

```ceu
output bool GFX_SET_GRID;
```

- Parameters:
    - `bool`: enables (`true`) or disables (`false`) the grid

The ratio between the real and logical dimensions must be greater then one.

### GFX_SET_RGB

Changes the color for all subsequent drawing operation.

```ceu
output (u8,u8,u8) GFX_SET_RGB;
```

- Parameters:
    - `u8`: new red component
    - `u8`: new green component
    - `u8`: new blue component

### GFX_SET_TEXT_CURSOR

Changes the cursor position for drawing text.

```ceu
output (u16,u16) GFX_SET_TEXT_CURSOR;
```

- Parameters:
    - `u16`: new position in the `x-axis`
    - `u16`: new position in the `y-axis`

### GFX_SET_TEXT_FONT

Changes the font for drawing text.

```ceu
output (string,u16) GFX_SET_TEXT_FONT;
```

- Parameters:
    - `string`: path for the `.ttf` font filename
    - `u16`: size of the new font

## Drawing

### GFX_DRAW_BMP

Draws a bitmap image on the screen.

```ceu
output (string,u16,u16) GFX_DRAW_BMP;
```

- Parameters:
    - `string`: path for the `.bmp` image filename
    - `u16`: drawing position in the `x-axis`
    - `u16`: drawing position in the `y-axis`

### GFX_DRAW_PIXEL

Draws a pixel on the screen.

```ceu
output (u16,u16) GFX_DRAW_PIXEL;
```

- Parameters:
    - `u16`: drawing position in the `x-axis`
    - `u16`: drawing position in the `y-axis`

The drawing color is specified with [`GFX_SET_RGB`][GFX_SET_RGB].

### GFX_DRAW_RECT

Draws a rectangle on the screen.

```ceu
output (u16,u16,u16,u16) GFX_DRAW_RECT;
```

- Parameters:
    - `u16`: drawing position in the `x-axis`
    - `u16`: drawing position in the `y-axis`
    - `u16`: rectangle width
    - `u16`: rectangle height

The drawing color is specified with [`GFX_SET_RGB`][GFX_SET_RGB].

### GFX_DRAW_TEXT

Draws a text on the screen.

```ceu
output string GFX_DRAW_TEXT;
```

- Parameters:
    - `string`: text to draw

The drawing position is first specified with
[`GFX_SET_TEXT_CURSOR`][GFX_SET_TEXT_CURSOR].
The cursor advances automatically for the position after the text.

The drawing font is specified with [`GFX_SET_TEXT_FONT`][GFX_SET_TEXT_FONT].

The drawing color is specified with [`GFX_SET_RGB`][GFX_SET_RGB].

### GFX_DRAW_TEXTLN

Draws a line of text on the screen.

```ceu
output string GFX_DRAW_TEXTLN;
```

The drawing position is first specified with
[`GFX_SET_TEXT_CURSOR`][GFX_SET_TEXT_CURSOR].
The cursor advances automatically for the next line after the text, at the same
initial position.

The drawing font is specified with [`GFX_SET_TEXT_FONT`][GFX_SET_TEXT_FONT].

The drawing color is specified with [`GFX_SET_RGB`][GFX_SET_RGB].

## Other

### GFX_CLEAR

Clears the screen.

```ceu
output void GFX_CLEAR;
```

The clear color is specified with [`GFX_SET_RGB`][GFX_SET_RGB].

### GFX_SCREENSHOT

Takes a screen shot.

```ceu
output string GFX_SCREENSHOT;
```

- Parameters:
    - `string`: path for the `.bmp` image filename to generate
