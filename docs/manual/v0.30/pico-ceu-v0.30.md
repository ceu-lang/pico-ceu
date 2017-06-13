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
output bool GFX_SET_GRID;
```

- Parameters:
    - `bool`: enables (`true`) or disables (`false`) the grid

The ratio between the real and logical dimensions must be greater then one.

#### GFX_SET_RGB

Changes the color for all subsequent drawing operation.

```ceu
output (u8,u8,u8) GFX_SET_RGB;
```

- Parameters:
    - `u8`: new red component
    - `u8`: new green component
    - `u8`: new blue component

#### GFX_SET_TEXT_CURSOR

Changes the cursor position for drawing text.

```ceu
output (u16,u16) GFX_SET_TEXT_CURSOR;
```

- Parameters:
    - `u16`: new position in the `x-axis`
    - `u16`: new position in the `y-axis`

#### GFX_SET_TEXT_FONT

Changes the font for drawing text.

```ceu
output (string,u16) GFX_SET_TEXT_FONT;
```

- Parameters:
    - `string`: path for the `.ttf` font filename
    - `u16`: size of the new font

### Drawing

#### GFX_DRAW_BMP

Draws a bitmap image on the screen.

```ceu
output (string,u16,u16) GFX_DRAW_BMP;
```

- Parameters:
    - `string`: path for the `.bmp` image filename
    - `u16`: drawing position in the `x-axis`
    - `u16`: drawing position in the `y-axis`

#### GFX_DRAW_PIXEL

Draws a pixel on the screen.

```ceu
output (u16,u16) GFX_DRAW_PIXEL;
```

- Parameters:
    - `u16`: drawing position in the `x-axis`
    - `u16`: drawing position in the `y-axis`

The drawing color is specified with [`GFX_SET_RGB`][GFX_SET_RGB].

#### GFX_DRAW_RECT

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

#### GFX_DRAW_TEXT

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

#### GFX_DRAW_TEXTLN

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

### Other

#### GFX_CLEAR

Clears the screen.

```ceu
output void GFX_CLEAR;
```

The clear color is specified with [`GFX_SET_RGB`][GFX_SET_RGB].

#### GFX_SCREENSHOT

Takes a screen shot.

```ceu
output string GFX_SCREENSHOT;
```

- Parameters:
    - `string`: path for the `.bmp` image filename to generate

# Input Devices

## Input Devices

Provides input handling, such as for keyboard and mouse.

### Keyboard

#### KEY_PRESS

```ceu
input (bool,u16) KEY_PRESS;
```

- Occurrence:
    - whenever a keyboard key is pressed or released
- Payload:
    - `bool`: if the key was pressed (`true`) or released (`false`)
    - `u16`:  the numeric key code

`TODO: key codes`

### Mouse

#### MOUSE_CLICK

```ceu
input (bool,int,u16,u16) MOUSE_CLICK;
```

- Occurrence:
    - whenever a mouse button is pressed or released
- Payload:
    - `bool`: if the button was pressed (`true`) or released (`false`)
    - `int`:  the numeric button code (`TODO: left, middle, right?`)
    - `u16`:  the current mouse position in the `x-axis`
    - `u16`:  the current mouse position in the `y-axis`

#### MOUSE_MOVE

```ceu
input (u16,u16) MOUSE_MOVE;
```

- Occurrence:
    - whenever the mouse moves
- Payload:
    - `u16`:  the current mouse position in the `x-axis`
    - `u16`:  the current mouse position in the `y-axis`

# Frame Management

## Frame Management

Manages the game frames, such as for updating animation and redrawing the
screen.

### Configuration

#### FRAMES_SET

Enables or disables the generation of periodic `FRAMES_UPDATE` and
`FRAMES_REDRAW` inputs to the application.

```ceu
output bool FRAMES_SET;
```

- Parameters:
    - `bool`: enables (`true`) or disables (`false`) the generation of frames

#### FRAMES_SET_CLEAR_RGB

Changes the redrawing background color.

```
output (u8,u8,u8) FRAMES_SET_CLEAR_RGB;
```

- Parameters:
    - `u8`: new red component
    - `u8`: new green component
    - `u8`: new blue component

On every frame, the screen is cleared with the background color.

The default color is black.

### Update

#### FRAMES_UPDATE

```ceu
input int FRAMES_UPDATE;
```

- Occurrence:
    - on every frame, before [`FRAMES_REDRAW`][FRAMES_REDRAW]
- Payload:
    - `int`: the number of elapsed milliseconds since the previous frame

### Redraw

#### FRAMES_REDRAW

```ceu
input void FRAMES_REDRAW;
```

- Occurrence:
    - on every frame, after [`FRAMES_UPDATE`][FRAMES_UPDATE]

Before the event occurs, the screen is cleared with the color set on
[`FRAMES_SET_CLEAR_RGB`][FRAMES_SET_CLEAR_RGB].

# Window Management

## Window Management

Manages the game window.

### Configuration

#### WINDOW_SET_SIZE

Changes the real and logical sizes of the window.

```ceu
output (u16,u16,u16,u16) WINDOW_SET_SIZE;
```

- Parameters:
    - `u16`: the new real width
    - `u16`: the new real height
    - `u16`: the new logical width
    - `u16`: the new logical height

The division between the real and logical dimensions must be exact.

#### WINDOW_SET_TITLE

Changes the title of the window.

```ceu
output string WINDOW_SET_TITLE;
```

- Parameters:
    - `string`: new window title

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

