# Input Devices

Provides input handling, such as for keyboard and mouse.

## Keyboard

### KEY_PRESS

```ceu
input (switch,number) KEY_PRESS
```

- Occurrences:
    - whenever a keyboard key is pressed or released
- Payload:
    - `switch`: new key state
        - `on`: key is now pressed
        - `off`: key is now released
    - `number`: numeric key code

`TODO: key codes`

## Mouse

### MOUSE_CLICK

```ceu
input (switch,number,number,number) MOUSE_CLICK
```

- Occurrences:
    - whenever a mouse button is pressed or released
- Payload:
    - `switch`: new button state
        - `on`: button is now pressed
        - `off`: button is now released
    - `number`:  numeric button code (`TODO: left, middle, right?`)
    - `number`:  current mouse position in the `x-axis`
    - `number`:  current mouse position in the `y-axis`

### MOUSE_MOVE

```ceu
input (number,number) MOUSE_MOVE
```

- Occurrences:
    - whenever the mouse moves
- Payload:
    - `number`:  current mouse position in the `x-axis`
    - `number`:  current mouse position in the `y-axis`
