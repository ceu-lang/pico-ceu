# Frame Management

Manages the game frames, such as for updating animations and redrawing the
screen.

## Configuration

### FRAMES_SET

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

### FRAMES_SET_CLEAR_RGB

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

## Update

### FRAMES_UPDATE

```ceu
input (number) FRAMES_UPDATE
```

- Occurrences:
    - on every frame, before [`FRAMES_REDRAW`](#frames_redraw)
- Payload:
    - `number`: the number of elapsed milliseconds since the previous frame

## Redraw

### FRAMES_REDRAW

```ceu
input (none) FRAMES_REDRAW
```

- Occurrences:
    - on every frame, after [`FRAMES_UPDATE`](#frames_update)
- Parameters:
    - `none`: no parameters

Before the input occurs, the screen is cleared with the color set with
[`FRAMES_SET_CLEAR_RGB`](#frames_set_clear_rgb).
