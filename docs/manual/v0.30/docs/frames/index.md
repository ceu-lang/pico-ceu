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

## Inputs

### FRAMES_UPDATE

```ceu
input (integer) FRAMES_UPDATE
```

- Occurrences:
    - on every frame, before [`FRAMES_REDRAW`](#frames_redraw)
- Payload:
    - `integer`: the number of milliseconds elapsed since the previous frame

### FRAMES_REDRAW

```ceu
input (none) FRAMES_REDRAW
```

- Occurrences:
    - on every frame, after [`FRAMES_UPDATE`](#frames_update)
- Payload:
    - `none`: no payload

Before the input occurs, the screen is automatically cleared with
[`WINDOW_CLEAR`](../window/#window_clear).
