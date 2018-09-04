# Input Devices

Provides input handling, such as for keyboard and mouse.

## Keyboard

### KEY_PRESS

```ceu
input (integer) KEY_PRESS
```

- Occurrences:
    - whenever a keyboard key is pressed
- Payload:
    - `integer`: numeric key code

`TODO: key codes`

### KEY_UNPRESS

```ceu
input (integer) KEY_UNPRESS
```

- Occurrences:
    - whenever a keyboard key is released
- Payload:
    - `integer`: numeric key code

`TODO: key codes`

## Mouse

### MOUSE_CLICK

```ceu
input (integer,integer,integer) MOUSE_CLICK
```

- Occurrences:
    - whenever a mouse button is pressed
- Payload:
    - `integer`:  numeric button code (`TODO: left, middle, right?`)
    - `integer`:  current mouse position in the `x-axis`
    - `integer`:  current mouse position in the `y-axis`

### MOUSE_UNCLICK

```ceu
input (integer,integer,integer) MOUSE_UNCLICK
```

- Occurrences:
    - whenever a mouse button is released
- Payload:
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
