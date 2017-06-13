# Input Devices

Provides input handling, such as for keyboard and mouse.

## Keyboard

### KEY_PRESS

```ceu
input (bool,u16) KEY_PRESS
```

- Occurrences:
    - whenever a keyboard key is pressed or released
- Payload:
    - `bool`: new key state
        - `true`: key is now pressed
        - `false`: key is now released
    - `u16`: numeric key code

`TODO: key codes`

## Mouse

### MOUSE_CLICK

```ceu
input (bool,int,u16,u16) MOUSE_CLICK
```

- Occurrences:
    - whenever a mouse button is pressed or released
- Payload:
    - `bool`: new button state
        - `true`: button is now pressed
        - `false`: button is now released
    - `int`:  numeric button code (`TODO: left, middle, right?`)
    - `u16`:  current mouse position in the `x-axis`
    - `u16`:  current mouse position in the `y-axis`

### MOUSE_MOVE

```ceu
input (u16,u16) MOUSE_MOVE
```

- Occurrences:
    - whenever the mouse moves
- Payload:
    - `u16`:  current mouse position in the `x-axis`
    - `u16`:  current mouse position in the `y-axis`
