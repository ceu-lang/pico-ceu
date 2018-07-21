# Move around using NETWORK features
In [move.ceu](../move.ceu) example, the user can movement a pixel around the window using the keyboard arrow keys. 

This example is based on move.ceu, so, if you are starting programming with Céu, is recommended to that a look on it and understant its code.

![](images/move-net-2-screen)

In this application, we use pico-Céu [Network features](https://ceu-lang.github.io/pico-ceu/out/manual/v0.30/net/#net_receive) to create a distributed version of move.ceu. It supports two users moving independent pixels and, as seen in the figure above, show the movement of the pixels in both instances of the example.

# First steps
Let's start from the move.ceu example. Copy and paste the code to a new file and change the size of the window using the ```WINDOW_SET_SIZE```, and its title, using ```WINDOW_SET_TITLE```. Also, make sure to uncomment the lines responsible for clearing the old pixel position.

```c#
#define PLAYER 1

//CONFIG THE WINDOW
emit WINDOW_SET_SIZE(30*20, 30*20, 30, 30);
emit WINDOW_SET_TITLE("Moving Around Using Network");

var integer x = 0;
var integer y = 0;

//DRAW THE PIXEL IN THE INITIAL POSITION
emit GRAPHICS_DRAW_PIXEL(x,y);

var integer key;

//EXECUTE ON EVERY KEY PRESS
every key in KEY_PRESS do   

    //CLEAR THE OLD POSITION                  
    emit GRAPHICS_SET_COLOR_NAME(COLOR_BLACK);
    emit GRAPHICS_DRAW_PIXEL(x,y);

    //MOVE IN FOUR DIRECTIONS
    if key == KEY_LEFT then
        x = x - 1;
    else/if key == KEY_RIGHT then
        x = x + 1;
    else/if key == KEY_UP then
        y = y + 1;
    else/if key == KEY_DOWN then
        y = y - 1;
    end

    //DRAW THE PIXEL IN A NEW POSITION
    emit GRAPHICS_SET_COLOR_NAME(COLOR_WHITE);
    emit GRAPHICS_DRAW_PIXEL(x,y);
end
```

# Supporting two different instances of move.ceu
We use preprocessor directives to define which instance (white or green) will be compilled. Check [this tutorial to learn more about preprocessor directives](https://www.tutorialspoint.com/cprogramming/c_preprocessors.htm).

```c#
#define PLAYER 1

//EACH PLAYER INITIATES WITH A DIFFERENT COLOR AND POSITION
#if PLAYER == 1
    #define MAIN_COLOR COLOR_WHITE
    #define INITIAL_POSITION_X -10
    #define INITIAL_POSITION_Y 0
#elif PLAYER == 2
    #define MAIN_COLOR COLOR_GREEN
    #define INITIAL_POSITION_X 10
    #define INITIAL_POSITION_Y 0    
#endif
```

In the beggining of the code, we defined ```c# PLAYER``` with the value ```c# 1``` and then, the ```c# MAIN_COLOR``` (the color that will be used to draw the pixel and a top bar) and the pixel initial position depending on the value of ```PLAYER``` (```c# INITIAL_POSITION_X``` and ```c# INITIAL_POSITION_Y```).

With the value 1, the example will be compiled with the pixel located on the left side of the window and the color white. With the value 2, otherwise, the pixel will be green and located on the right side.

## Displaying the top bar
To display the top bar, we can use a rectangle with height equals 1, and width equals 30 (the width of the window). In Céu, the anchor of the drawing operations is, by default, the center of the shape. So, for the rectangle occupies all the top of the window, we define its position as 0 for the x-axis (the center of the x-axis).

> The anchor specifies the part of the shape to appear at the pixel position of the drawing operation.

Its position in the y-axis is 15 so that the bar is located on the top. It's interesting to note that the anchor vertical position is irrelevant, since the rectangle height is equal to 1.

Check [pico-Céu manual](https://ceu-lang.github.io/pico-ceu/out/manual/v0.30/graphics/#graphics_set_anchor) to learn more about anchors.

```c#
//DISPLAY A RECTANGLE ON THE TOP OF THE SCREEN TO INDICATE WHICH PLAYER YOU ARE
emit GRAPHICS_SET_COLOR_NAME(MAIN_COLOR);
emit GRAPHICS_DRAW_RECT(0, 15, 30, 1);
```

To set the color of the rectangle, we use the ```c# MAIN_COLOR``` defined above. Before compiling, the pre-processor will replace the ```c# MAIN_COLOR``` with ```c# COLOR_WHITE``` or ```c# COLOR_GREEN```, depending on the value of the ```c# PLAYER```.

Add the above code after the window configuration and execute the example defining the ```c# PLAYER``` as 1, and, after, as 2.

## Defining the initial pixel position
To each instance have a different initial pixel position, just use the ```c# INITIAL_POSITION_X``` and ```c# INITIAL_POSITION_Y``` to initialize the x and y variables.

```c#
var integer x = INITIAL_POSITION_X;
var integer y = INITIAL_POSITION_Y;
```

## Changing the pixel color
Compiling the code we can see that the pixel is already with the ```c# MAIN_COLOR```, but returns to color white after a movement. It initiates with the ```c# MAIN_COLOR``` because this is the last color defined before the initial pixel draw:
```c#
// <...>
emit GRAPHICS_SET_COLOR_NAME(MAIN_COLOR);
emit GRAPHICS_DRAW_RECT(0, 15, 30, 1);

var integer x = 0;
var integer y = 0;

//DRAW THE PIXEL IN THE INITIAL POSITION
emit GRAPHICS_DRAW_PIXEL(x,y);
// <...>
```

But when we display the pixel inside the ```every``` the last color definded is ```COLOR_WHITE```:
```c#
// <...>
//DRAW THE PIXEL IN A NEW POSITION
emit GRAPHICS_SET_COLOR_NAME(COLOR_WHITE);
emit GRAPHICS_DRAW_PIXEL(x,y);
// <...>
```
We, then, simply have to replace ```c# COLOR_WHITE``` with ```c# MAIN_COLOR```.

# Stopping the pixel from exiting through the window
Currently, the pixel can movement outside the window. To stop that, we can verify if it can moves to the desirable position before modify its x-axis and y-axis position.

```c#
//MOVE IN FOUR DIRECTIONS
if key == KEY_LEFT then
    //WINDOW COLLISION WITH LEFT SIDE
    if x > -15 then
        x = x - 1; 
    end
else/if key == KEY_RIGHT then
    //WINDOW COLLISION WITH RIGHT SIDE
    if x < 14 then
        x = x + 1;
    end
else/if key == KEY_UP then
    //WINDOW COLLISION WITH TOP SIDE
    if (y < 13) then
        y = y + 1;
    end
else/if key == KEY_DOWN then
    //WINDOW COLLISION WITH BOTTOM SIDE
    if (y > -14) then
        y = y - 1;
    end
end
```

The -15 and 14 (respectively located in lines 4 and 9) are the leftmost and the rightmost x-axis postions of the window. The -14 (in line 19), is, likely, the bottommost y-axis position, but the 13 (in line 14) isn't the topmost. Since we have the top bar, the pixel cannot move until the top.