# Window Management

Manages the application window.

## Configuration

### WINDOW_SET_CLEAR_COLOR_NAME

Changes the background color of [`WINDOW_CLEAR`](#window_clear).

```ceu
output (Color) WINDOW_SET_CLEAR_COLOR_NAME
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

### WINDOW_SET_CLEAR_COLOR_RGB

Changes the background color of [`WINDOW_CLEAR`](#window_clear) in RGB.

```
output (integer,integer,integer) WINDOW_SET_CLEAR_COLOR_RGB
```

- Parameters:
    - `integer`: new red component
    - `integer`: new green component
    - `integer`: new blue component

The default color is black.

### WINDOW_SET_GRID

Enables or disables a visual grid delimiting the screen pixels.

```ceu
output (yes/no) WINDOW_SET_GRID
```

- Parameters:
    - `yes/no`: new state
        - `yes`: enables the grid
        - `no`: disables the grid

The ratio between the real and logical dimensions set with
[`WINDOW_SET_SIZE`](../window/#window_set_size) must be greater then one.

The window is automatically cleared with [`WINDOW_CLEAR`](#window_clear).

### WINDOW_SET_SIZE

Changes the real and logical sizes of the window.

```ceu
output (integer,integer,integer,integer) WINDOW_SET_SIZE
```

- Parameters:
    - `integer`: new real width
    - `integer`: new real height
    - `integer`: new logical width
    - `integer`: new logical height

The window is automatically cleared with [`WINDOW_CLEAR`](#window_clear).

The arithmetic division between the real and logical dimensions must be exact.

### WINDOW_SET_TITLE

Changes the title of the window.

```ceu
output (text) WINDOW_SET_TITLE
```

- Parameters:
    - `text`: new window title

## Clear

### WINDOW_CLEAR

Clears the window screen.

```ceu
output (none) WINDOW_CLEAR
```

- Parameters:
    - `none`: no parameters

The clear color is specified with
[`WINDOW_SET_CLEAR_COLOR_NAME`](#window_set_clear_color_name) or
[`WINDOW_SET_CLEAR_COLOR_RGB`](#window_set_clear_color_rgb).

The default color is black.
