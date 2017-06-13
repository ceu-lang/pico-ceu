# Frame Management

Manages the game frames, such as for updating animation and redrawing the
screen.

## Configuration

### FRAMES_SET

Enables or disables the generation of periodic `FRAMES_UPDATE` and
`FRAMES_REDRAW` inputs to the application.

```ceu
output bool FRAMES_SET
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

On every frame, the screen is cleared with the background color.

The default color is black.

## Update

### FRAMES_UPDATE

```ceu
input int FRAMES_UPDATE
```

- Occurrence:
    - on every frame, before [`FRAMES_REDRAW`](#frames_redraw)
- Payload:
    - `int`: the number of elapsed milliseconds since the previous frame

## Redraw

### FRAMES_REDRAW

```ceu
input void FRAMES_REDRAW
```

- Occurrence:
    - on every frame, after [`FRAMES_UPDATE`](#frames_update)

Before the event occurs, the screen is cleared with the color set on
[`FRAMES_SET_CLEAR_RGB`](#frames_set_clear_rgb).
