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


Examples:
```
var int c = await KEY_PRESS;

_printf("%c\n", c);
```

```
var int c = await KEY_PRESS until c==KEY_a;

_printf("%c\n", c);
```

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
    - `integer`:  numeric button code  
        - MOUSE_LEFT
        - MOUSE_MIDDLE
        - MOUSE_RIGHT
        - MOUSE_X1
        - MOUSE_X2
    - `integer`:  current mouse position in the `x-axis`
    - `integer`:  current mouse position in the `y-axis`    

Example:
```
var int c;
var int x;
var int y;

(c,x,y) = await MOUSE_CLICK until c==MOUSE_LEFT;

_printf("(%d,%d)\n", x,y);
```

### MOUSE_UNCLICK

```ceu
input (integer,integer,integer) MOUSE_UNCLICK
```

- Occurrences:
    - whenever a mouse button is released
- Payload:
    - `integer`:  numeric button code (same as [`MOUSE_CLICK`](#mouse_click))
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
