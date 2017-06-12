# Introduction

## Introduction

`TODO`

# Graphics

## Graphics

Provides graphics operations, such as for drawing pixels and images on the
screen.

### Configuration

#### GFX_SET_RGB

```ceu
output (u8,u8,u8) GFX_SET_RGB;
```

#### GFX_SET_FONT

```ceu
output (string,u16) GFX_SET_FONT;
```

#### GFX_SET_CURSOR

```ceu
output (u8,u8) GFX_SET_CURSOR;
```

#### GFX_SET_GRID

```ceu
output bool GFX_SET_GRID;
```

### Drawing

#### GFX_DRAW_PIXEL

```ceu
output (u16,u16) GFX_DRAW_PIXEL;
```

#### GFX_DRAW_RECT

```ceu
output (u16,u16,u16,u16) GFX_DRAW_RECT;
```

#### GFX_DRAW_BMP

```ceu
output (string,u16,u16) GFX_DRAW_BMP;
```

#### GFX_DRAW_TEXT

```ceu
output string GFX_DRAW_TEXT;
```

#### GFX_DRAW_TEXTLN

```ceu
output string GFX_DRAW_TEXTLN;
```

### Other

#### GFX_SCREENSHOT

```ceu
output string GFX_SCREENSHOT;
```

#### GFX_CLEAR

```ceu
output void GFX_CLEAR;
```

# Input Devices

## Input Devices

Provides input handling, such as for keyboard and mouse.

### Keyboard

#### KEY_PRESS

```ceu
input (bool,u16) KEY_PRESS;
```

`TODO: key codes`

### Mouse

#### MOUSE_CLICK

```ceu
input (bool,int,u16,u16) MOUSE_CLICK;
```

#### MOUSE_MOVE

```ceu
input (u16,u16) MOUSE_MOVE;
```

# Frame Management

## Frame Management

Manages the game frames, such as for updating animation and redrawing the
screen.

### Configuration

#### FRAMES_SET

```ceu
output bool FRAMES_SET;
```

#### FRAMES_SET_CLEAR_RGB

```
output (u8,u8,u8)        FRAMES_SET_CLEAR_RGB;
```

### Update

#### FRAMES_UPDATE

```ceu
input int FRAMES_UPDATE;
```

### Redraw

#### FRAMES_REDRAW

```ceu
input void FRAMES_REDRAW;
```

# Window Management

## Window Management

Manages the game window.

### Configuration

#### WINDOW_SET_TITLE

```ceu
output string WINDOW_SET_TITLE;
```

#### WINDOW_SET_SIZE

```ceu
output (u16,u16,u16,u16) WINDOW_SET_SIZE;
```

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


