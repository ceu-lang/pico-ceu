# Graphics

Provides graphics operations, such as for drawing pixels and images on the
screen.

## Configuration

### GFX_SET_RGB

```ceu
output (u8,u8,u8) GFX_SET_RGB;
```

### GFX_SET_FONT

```ceu
output (string,u16) GFX_SET_FONT;
```

### GFX_SET_CURSOR

```ceu
output (u8,u8) GFX_SET_CURSOR;
```

### GFX_SET_GRID

```ceu
output bool GFX_SET_GRID;
```

## Drawing

### GFX_DRAW_PIXEL

```ceu
output (u16,u16) GFX_DRAW_PIXEL;
```

### GFX_DRAW_RECT

```ceu
output (u16,u16,u16,u16) GFX_DRAW_RECT;
```

### GFX_DRAW_BMP

```ceu
output (string,u16,u16) GFX_DRAW_BMP;
```

### GFX_DRAW_TEXT

```ceu
output string GFX_DRAW_TEXT;
```

### GFX_DRAW_TEXTLN

```ceu
output string GFX_DRAW_TEXTLN;
```

## Other

### GFX_SCREENSHOT

```ceu
output string GFX_SCREENSHOT;
```

### GFX_CLEAR

```ceu
output void GFX_CLEAR;
```
