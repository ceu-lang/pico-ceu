# Introduction

## Introduction

`TODO`

# Graphics

## Graphics

Provides graphics operations, such as for drawing pixels and images on the
screen.

### Configuration

#### GFX_SET_GRID

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

#### GFX_SET_RGB

Changes the color of all subsequent drawing operations.

```ceu
output (integer,integer,integer) GFX_SET_RGB
```

- Parameters:
    - `integer`: new red component
    - `integer`: new green component
    - `integer`: new blue component

#### GFX_SET_TEXT_CURSOR

Changes the cursor position for drawing text.

```ceu
output (integer,integer) GFX_SET_TEXT_CURSOR
```

- Parameters:
    - `integer`: new position in the `x-axis`
    - `integer`: new position in the `y-axis`

#### GFX_SET_TEXT_FONT

Changes the font for drawing text.

```ceu
output (text,integer) GFX_SET_TEXT_FONT
```

- Parameters:
    - `text`: path for the `.ttf` font filename
    - `integer`: height of the new font in pixels

### Drawing Operations

#### GFX_CLEAR

Clears the screen.

```ceu
output (none) GFX_CLEAR
```

- Parameters:
    - `none`: no parameters

The clear color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

#### GFX_DRAW_BMP

Draws a bitmap image on the screen.

```ceu
output (text,integer,integer) GFX_DRAW_BMP
```

- Parameters:
    - `text`: path for the `.bmp` image filename
    - `integer`: drawing position in the `x-axis`
    - `integer`: drawing position in the `y-axis`

#### GFX_DRAW_PIXEL

Draws a pixel on the screen.

```ceu
output (integer,integer) GFX_DRAW_PIXEL
```

- Parameters:
    - `integer`: drawing position in the `x-axis`
    - `integer`: drawing position in the `y-axis`

The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

#### GFX_DRAW_RECT

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

#### GFX_DRAW_TEXT

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

#### GFX_DRAW_TEXTLN

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

### Other

#### GFX_SCREENSHOT

Takes a screen shot.

```ceu
output (text) GFX_SCREENSHOT
```

- Parameters:
    - `text`: path for the `.bmp` image filename to generate

# Input Devices

## Input Devices

Provides input handling, such as for keyboard and mouse.

### Keyboard

#### KEY_PRESS

```ceu
input KEY_PRESS: (yesno,integer)
```

- Occurrences:
    - whenever a keyboard key is pressed or released
- Payload:
    - `yesno`: new key state
        - `yes`: key is now pressed
        - `no`: key is now released
    - `integer`: numeric key code

`TODO: key codes`

### Mouse

#### MOUSE_CLICK

```ceu
input MOUSE_CLICK (yesno,integer,integer,integer)
```

- Occurrences:
    - whenever a mouse button is pressed or released
- Payload:
    - `yesno`: new button state
        - `yes`: button is now pressed
        - `no`: button is now released
    - `integer`:  numeric button code (`TODO: left, middle, right?`)
    - `integer`:  current mouse position in the `x-axis`
    - `integer`:  current mouse position in the `y-axis`

#### MOUSE_MOVE

```ceu
input (integer,integer) MOUSE_MOVE
```

- Occurrences:
    - whenever the mouse moves
- Payload:
    - `integer`:  current mouse position in the `x-axis`
    - `integer`:  current mouse position in the `y-axis`

# Frame Management

## Frame Management

Manages the game frames, such as for updating animations and redrawing the
screen.

### Configuration

#### FRAMES_SET

Enables or disables the generation of periodic
[`FRAMES_UPDATE`](#frames_update) and [`FRAMES_REDRAW`](#frames_redraw)
inputs to the application.

```ceu
output (yesno) FRAMES_SET
```

- Parameters:
    - `yesno`: new state
        - `yes`: enables the generation of frames
        - `no`: disables the generation of frames

#### FRAMES_SET_CLEAR_RGB

Changes the redrawing background color.

```
output (integer,integer,integer) FRAMES_SET_CLEAR_RGB
```

- Parameters:
    - `integer`: new red component
    - `integer`: new green component
    - `integer`: new blue component

On every frame before [`FRAMES_REDRAW`](#frames_redraw), the screen is cleared
with the background color.

The default color is black.

### Update

#### FRAMES_UPDATE

```ceu
input (integer) FRAMES_UPDATE
```

- Occurrences:
    - on every frame, before [`FRAMES_REDRAW`](#frames_redraw)
- Payload:
    - `integer`: the number of elapsed milliseconds since the previous frame

### Redraw

#### FRAMES_REDRAW

```ceu
input (none) FRAMES_REDRAW
```

- Occurrences:
    - on every frame, after [`FRAMES_UPDATE`](#frames_update)
- Payload:
    - `none`: no payload

Before the input occurs, the screen is cleared with the color set with
[`FRAMES_SET_CLEAR_RGB`](#frames_set_clear_rgb).

# Window Management

## Window Management

Manages the application window.

### Configuration

#### WINDOW_SET_SIZE

Changes the real and logical sizes of the window.

```ceu
output (integer,integer,integer,integer) WINDOW_SET_SIZE
```

- Parameters:
    - `integer`: new real width
    - `integer`: new real height
    - `integer`: new logical width
    - `integer`: new logical height

The arithmetic division between the real and logical dimensions must be exact.

#### WINDOW_SET_TITLE

Changes the title of the window.

```ceu
output (text) WINDOW_SET_TITLE
```

- Parameters:
    - `text`: new window title

# License

License
=======

pico-Céu is distributed under the MIT license reproduced below:

```
 Copyright (C) 2012-2017 Francisco Sant'Anna

 Permission is hereby granted, free of charge, to any person obtaining a copy of
 this software and associated documentation files (the "Software"), to deal in
 the Software without restriction, including without limitation the rights to
 use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 of the Software, and to permit persons to whom the Software is furnished to do
 so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
```


