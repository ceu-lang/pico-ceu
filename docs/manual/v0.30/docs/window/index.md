# Window Management

Manages the application window.

## Configuration

### WINDOW_SET_SIZE

Changes the real and logical sizes of the window.

```ceu
output (integer,integer,integer,integer) WINDOW_SET_SIZE
```

- Parameters:
    - `integer`: new real width
    - `integer`: new real height
    - `integer`: new logical width
    - `integer`: new logical height

The arithmetic division between the real and logical dimensions must be exact.

### WINDOW_SET_TITLE

Changes the title of the window.

```ceu
output (text) WINDOW_SET_TITLE
```

- Parameters:
    - `text`: new window title
