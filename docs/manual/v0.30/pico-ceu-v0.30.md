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
output (switch) GFX_SET_GRID
```

- Parameters:
    - `switch`: new state
        - `on`: enables the grid
        - `off`: disables the grid

The ratio between the real and logical dimensions set with
[`WINDOW_SET_SIZE`](../window/#window_set_size) must be greater then one.

#### GFX_SET_RGB

Changes the color of all subsequent drawing operations.

```ceu
output (number,number,number) GFX_SET_RGB
```

- Parameters:
    - `number`: new red component
    - `number`: new green component
    - `number`: new blue component

#### GFX_SET_TEXT_CURSOR

Changes the cursor position for drawing text.

```ceu
output (number,number) GFX_SET_TEXT_CURSOR
```

- Parameters:
    - `number`: new position in the `x-axis`
    - `number`: new position in the `y-axis`

#### GFX_SET_TEXT_FONT

Changes the font for drawing text.

```ceu
output (text,number) GFX_SET_TEXT_FONT
```

- Parameters:
    - `text`: path for the `.ttf` font filename
    - `number`: height of the new font in pixels

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
output (text,number,number) GFX_DRAW_BMP
```

- Parameters:
    - `text`: path for the `.bmp` image filename
    - `number`: drawing position in the `x-axis`
    - `number`: drawing position in the `y-axis`

#### GFX_DRAW_PIXEL

Draws a pixel on the screen.

```ceu
output (number,number) GFX_DRAW_PIXEL
```

- Parameters:
    - `number`: drawing position in the `x-axis`
    - `number`: drawing position in the `y-axis`

The drawing color is specified with [`GFX_SET_RGB`](#gfx_set_rgb).

#### GFX_DRAW_RECT

Draws a rectangle on the screen.

```ceu
output (number,number,number,number) GFX_DRAW_RECT
```

- Parameters:
    - `number`: drawing position in the `x-axis`
    - `number`: drawing position in the `y-axis`
    - `number`: rectangle width
    - `number`: rectangle height

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
input (switch,number) KEY_PRESS
```

- Occurrences:
    - whenever a keyboard key is pressed or released
- Payload:
    - `switch`: new key state
        - `on`: key is now pressed
        - `off`: key is now released
    - `number`: numeric key code

`TODO: key codes`

### Mouse

#### MOUSE_CLICK

```ceu
input (switch,number,number,number) MOUSE_CLICK
```

- Occurrences:
    - whenever a mouse button is pressed or released
- Payload:
    - `switch`: new button state
        - `on`: button is now pressed
        - `off`: button is now released
    - `number`:  numeric button code (`TODO: left, middle, right?`)
    - `number`:  current mouse position in the `x-axis`
    - `number`:  current mouse position in the `y-axis`

#### MOUSE_MOVE

```ceu
input (number,number) MOUSE_MOVE
```

- Occurrences:
    - whenever the mouse moves
- Payload:
    - `number`:  current mouse position in the `x-axis`
    - `number`:  current mouse position in the `y-axis`

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
output (switch) FRAMES_SET
```

- Parameters:
    - `switch`: new state
        - `on`: enables the generation of frames
        - `off`: disables the generation of frames

#### FRAMES_SET_CLEAR_RGB

Changes the redrawing background color.

```
output (number,number,number) FRAMES_SET_CLEAR_RGB
```

- Parameters:
    - `number`: new red component
    - `number`: new green component
    - `number`: new blue component

On every frame before [`FRAMES_REDRAW`](#frames_redraw), the screen is cleared
with the background color.

The default color is black.

### Update

#### FRAMES_UPDATE

```ceu
input (number) FRAMES_UPDATE
```

- Occurrences:
    - on every frame, before [`FRAMES_REDRAW`](#frames_redraw)
- Payload:
    - `number`: the number of elapsed milliseconds since the previous frame

### Redraw

#### FRAMES_REDRAW

```ceu
input (none) FRAMES_REDRAW
```

- Occurrences:
    - on every frame, after [`FRAMES_UPDATE`](#frames_update)
- Parameters:
    - `none`: no parameters

Before the input occurs, the screen is cleared with the color set with
[`FRAMES_SET_CLEAR_RGB`](#frames_set_clear_rgb).

# Window Management

## Window Management

Manages the application window.

### Configuration

#### WINDOW_SET_SIZE

Changes the real and logical sizes of the window.

```ceu
output (number,number,number,number) WINDOW_SET_SIZE
```

- Parameters:
    - `number`: new real width
    - `number`: new real height
    - `number`: new logical width
    - `number`: new logical height

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


