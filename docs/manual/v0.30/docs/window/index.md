# Window Management

Manages the application window.

## Configuration

### WINDOW_SET_SIZE

Changes the real and logical sizes of the window.

```ceu
output (u16,u16,u16,u16) WINDOW_SET_SIZE
```

- Parameters:
    - `u16`: new real width
    - `u16`: new real height
    - `u16`: new logical width
    - `u16`: new logical height

The arithmetic division between the real and logical dimensions must be exact.

### WINDOW_SET_TITLE

Changes the title of the window.

```ceu
output (string) WINDOW_SET_TITLE
```

- Parameters:
    - `string`: new window title
