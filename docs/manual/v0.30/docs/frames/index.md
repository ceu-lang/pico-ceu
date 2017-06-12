# Frame Management

Manages the game frames, such as for updating animation and redrawing the
screen.

## Configuration

### FRAMES_SET

```ceu
output bool FRAMES_SET;
```

### FRAMES_SET_CLEAR_RGB

```
output (u8,u8,u8)        FRAMES_SET_CLEAR_RGB;
```

## Update

### FRAMES_UPDATE

```ceu
input int FRAMES_UPDATE;
```

## Redraw

### FRAMES_REDRAW

```ceu
input void FRAMES_REDRAW;
```
