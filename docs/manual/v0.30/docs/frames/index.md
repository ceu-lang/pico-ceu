# Frame Management

Manages the game frames, such as for updating animations and redrawing the
screen.

## Configuration

### FRAMES_SET

Enables or disables the generation of periodic
[`FRAMES_UPDATE`](#frames_update) and [`FRAMES_REDRAW`](#frames_redraw)
inputs to the application.

```ceu
output (bool) FRAMES_SET
```

- Parameters:
    - `bool`: new state
        - `true`: enables the generation of frames
        - `false`: disables the generation of frames

### FRAMES_SET_CLEAR_RGB

Changes the redrawing background color.

```
output (u8,u8,u8) FRAMES_SET_CLEAR_RGB
```

- Parameters:
    - `u8`: new red component
    - `u8`: new green component
    - `u8`: new blue component

On every frame before [`FRAMES_REDRAW`](#frames_redraw), the screen is cleared
with the background color.

The default color is black.

## Update

### FRAMES_UPDATE

```ceu
input (int) FRAMES_UPDATE
```

- Occurrences:
    - on every frame, before [`FRAMES_REDRAW`](#frames_redraw)
- Payload:
    - `int`: the number of elapsed milliseconds since the previous frame

## Redraw

### FRAMES_REDRAW

```ceu
input (void) FRAMES_REDRAW
```

- Occurrences:
    - on every frame, after [`FRAMES_UPDATE`](#frames_update)

Before the input occurs, the screen is cleared with the color set with
[`FRAMES_SET_CLEAR_RGB`](#frames_set_clear_rgb).
