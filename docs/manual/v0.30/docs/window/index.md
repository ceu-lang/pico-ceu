# Window Management

Manages the application window.

## Configuration

### WINDOW_SET_SIZE

Changes the real and logical sizes of the window.

```ceu
output (number,number,number,number) WINDOW_SET_SIZE
```

- Parameters:
    - `number`: new real width
    - `number`: new real height
    - `number`: new logical width
    - `number`: new logical height

The arithmetic division between the real and logical dimensions must be exact.

### WINDOW_SET_TITLE

Changes the title of the window.

```ceu
output (text) WINDOW_SET_TITLE
```

- Parameters:
    - `text`: new window title
