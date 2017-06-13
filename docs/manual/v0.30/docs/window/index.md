# Window Management

Manages the game window.

## Configuration

### WINDOW_SET_SIZE

Changes the real and logical sizes of the window.

```ceu
output (u16,u16,u16,u16) WINDOW_SET_SIZE
```

- Parameters:
    - `u16`: the new real width
    - `u16`: the new real height
    - `u16`: the new logical width
    - `u16`: the new logical height

The division between the real and logical dimensions must be exact.

### WINDOW_SET_TITLE

Changes the title of the window.

```ceu
output string WINDOW_SET_TITLE
```

- Parameters:
    - `string`: new window title
