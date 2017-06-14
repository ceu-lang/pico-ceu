*pico-Céu* is a tiny programming environment for visual and interactive
applications such as video games.
It is composed of the programming language [Céu](www.ceu-lang.org/) and
minimalist libraries for input, graphics, and sound.

<!-- TODO: network -->

The example that follows draws a line from the top-left towards the bottom-left
of the screen, pixel by pixel, one every 100ms.
It also plays sound effects at the beginning and at the end of the process:

```ceu
emit WINDOW_SET_TITLE("Drawing Across");    // sets the window title

await KEY_PRESS;                            // waits for a key press (any key)
emit SOUND_PLAY("click.wav");               // plays a starting sound

var integer i;
loop i in [0 -> 50[ do                      // executes 50 times, varying i from 0 to 49
    emit GRAPHICS_DRAW_PIXEL(i,i);          //   draws a pixel in (i,i)
    await 100ms;                            //   waits for 100 milliseconds
end

emit SOUND_PLAY("click.wav");               // plays a terminating sound
await KEY_PRESS;                            // waits for a key press (any key)
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
