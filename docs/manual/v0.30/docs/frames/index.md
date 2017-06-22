# Frame Management

Manages the game frames, such as for updating animations and redrawing the
screen.

## Configuration

### FRAMES_SET

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

### FRAMES_SET_CLEAR_COLOR_NAME

Changes the redrawing background color.

```ceu
output (Color) FRAMES_SET_CLEAR_COLOR_NAME
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

The default color is black.

### FRAMES_SET_CLEAR_COLOR_RGB

Changes the redrawing background color in RGB.

```
output (integer,integer,integer) FRAMES_SET_CLEAR_COLOR_RGB
```

- Parameters:
    - `integer`: new red component
    - `integer`: new green component
    - `integer`: new blue component

On every frame before [`FRAMES_REDRAW`](#frames_redraw), the screen is cleared
with the background color.

The default color is black.

## Update

### FRAMES_UPDATE

```ceu
input (integer) FRAMES_UPDATE
```

- Occurrences:
    - on every frame, before [`FRAMES_REDRAW`](#frames_redraw)
- Payload:
    - `integer`: the number of elapsed milliseconds since the previous frame

## Redraw

### FRAMES_REDRAW

```ceu
input (none) FRAMES_REDRAW
```

- Occurrences:
    - on every frame, after [`FRAMES_UPDATE`](#frames_update)
- Payload:
    - `none`: no payload

Before the input occurs, the screen is cleared with the color set with
[`FRAMES_SET_CLEAR_COLOR_NAME`](#frames_set_clear_color_name) or
[`FRAMES_SET_CLEAR_COLOR_RGB`](#frames_set_clear_color_rgb).
