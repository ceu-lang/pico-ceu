*pico-Céu* is a tiny programming environment for visual and interactive
applications such as video games.
It is composed of the programming language [Céu](www.ceu-lang.org/) and
minimalist libraries for input, graphics, and sound.

<!-- TODO: network -->

The example that follows draws a line from the top-left towards the
bottom-right of the screen, pixel by pixel, one every 100ms.
It also plays sound effects at the beginning and at the end of the process:

```ceu
emit WINDOW_SET_TITLE("pico-Ceu");  // sets the window title

await KEY_PRESS;                    // waits for a key press (any key)
emit SOUND_PLAY("click1.wav");      // plays a starting sound

var integer i;
loop i in [0 -> 50[ do              // executes 50 times, varying i from 0 to 49
    emit GRAPHICS_DRAW_PIXEL(i,i);  //   draws a pixel in (i,i)
    await 100ms;                    //   waits for 100 milliseconds
end

emit SOUND_PLAY("click1.wav");      // plays a terminating sound
await KEY_PRESS;                    // waits for a key press (any key)
```

The next example also draws another line from the top-right towards the
bottom-left of the screen at the same time:

```ceu
emit WINDOW_SET_TITLE("pico-Ceu");
await KEY_PRESS;
emit SOUND_PLAY("res/click1.wav");

par/and do  // executes the next five indented lines in parallel...
    var integer i;
    loop i in [0 -> 50[ do
        emit GRAPHICS_DRAW_PIXEL(i,i);      // draws from (0,0) to (49,49)
        await 100ms;
    end
with        // ...with the next five indented lines...
    var integer i;
    loop i in [0 -> 50[ do
        emit GRAPHICS_DRAW_PIXEL(49-i,i);   // draws from (49,0) to (0,49)
        await 100ms;
    end
end         // ...and terminates when they both terminate (par/and)

emit SOUND_PLAY("res/click1.wav");
await KEY_PRESS;
```

*pico-Céu* design goals:

- Explicit I/O operations:
    - `await` for input
    - `emit` for output
- Straightforward graphics:
    - immediate feedback
    - pixel-level operations
    - pixelated logical screen
- Structured programming model:
    - sequential execution, no callbacks
    - logical parallelism with deterministic concurrency
- Simple development cycle:
    - minimalist API
    - easy installation and execution

*pico-Céu* insiprations:

- [pico-8](https://www.lexaloffle.com/pico-8.php)
    - minimalist and focused programming environment
- Basic:
    - graphics with immediate feedback
    - text and cursor facilities
- Pascal
    - verbose and comprehensible syntax
