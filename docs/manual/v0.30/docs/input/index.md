# Input Devices

Provides input handling, such as for keyboard and mouse.

## Keyboard

### KEY_PRESS

```ceu
input (yesno,integer) KEY_PRESS
```

- Occurrences:
    - whenever a keyboard key is pressed or released
- Payload:
    - `yesno`: new key state
        - `yes`: key is now pressed
        - `no`: key is now released
    - `integer`: numeric key code

`TODO: key codes`

## Mouse

### MOUSE_CLICK

```ceu
input (yesno,integer,integer,integer) MOUSE_CLICK
```

- Occurrences:
    - whenever a mouse button is pressed or released
- Payload:
    - `yesno`: new button state
        - `yes`: button is now pressed
        - `no`: button is now released
    - `integer`:  numeric button code (`TODO: left, middle, right?`)
    - `integer`:  current mouse position in the `x-axis`
    - `integer`:  current mouse position in the `y-axis`

### MOUSE_MOVE

```ceu
input (integer,integer) MOUSE_MOVE
```

- Occurrences:
    - whenever the mouse moves
- Payload:
    - `integer`:  current mouse position in the `x-axis`
    - `integer`:  current mouse position in the `y-axis`
