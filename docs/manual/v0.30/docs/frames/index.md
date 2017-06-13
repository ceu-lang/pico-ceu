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

### FRAMES_SET_CLEAR_RGB

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
[`FRAMES_SET_CLEAR_RGB`](#frames_set_clear_rgb).
