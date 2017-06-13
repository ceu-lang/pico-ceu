# Input Devices

Provides input handling, such as for keyboard and mouse.

## Keyboard

### KEY_PRESS

```ceu
input (bool,u16) KEY_PRESS;
```

- Occurrence:
    - whenever a keyboard key is pressed or released
- Payload:
    - `bool`: if the key was pressed (`true`) or released (`false`)
    - `u16`:  the numeric key code

`TODO: key codes`

## Mouse

### MOUSE_CLICK

```ceu
input (bool,int,u16,u16) MOUSE_CLICK;
```

- Occurrence:
    - whenever a mouse button is pressed or released
- Payload:
    - `bool`: if the button was pressed (`true`) or released (`false`)
    - `int`:  the numeric button code (`TODO: left, middle, right?`)
    - `u16`:  the current mouse position in the `x-axis`
    - `u16`:  the current mouse position in the `y-axis`

### MOUSE_MOVE

```ceu
input (u16,u16) MOUSE_MOVE;
```

- Occurrence:
    - whenever the mouse moves
- Payload:
    - `u16`:  the current mouse position in the `x-axis`
    - `u16`:  the current mouse position in the `y-axis`
