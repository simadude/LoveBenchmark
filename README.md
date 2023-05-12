# Benchmark of Löve2D

![image](screenshot.png)

This benchmark is based of [Coder Space's benchmark](https://github.com/StanislavPetrovV/Benchmark-2D) of game engines and graphics libraries for Python.

Note: Löve2D usually have v-sync turned on by default, which limits FPS to 60, so I turned it off in `love.load()` function.

The reason why I've decided to implement this is to see how well Löve2D can perform against Pygame in terms of performance.
The `options.lua` file has a few global variables defined in it as well as `OPTIMIZED` constant. The `OPTIMIZED` constant changes the way how every sprite is drawn onto the screen.

Here is the three levels of optimization:
- 0 - No optimizations. Every sprite is drawn onto the screen separately by indexing into a table of images and getting the image from there. The reason
- 1 - Every sprite is drawn separately, but now using ArrayImage object from Löve2D. By combining every sprite image into one ArrayImage object we can only send one texture to GPU and then just pass the index of every sprites image.
- 2 - Every sprite is drawn at once. By combining ArrayImage and SpriteBatch, we can add every sprite to SpriteBatch and just update each frame, this allows us to only make ONE drawcall to GPU.

## Benchmark graph
The results of the benchmark can differ alot. So remember that my machine may a lot less powerful than yours.
Here are the specs of my own pc:
 - CPU: AMD A8-5600k
 - GPU: AMD ATI Radeon HD 7560D
 - RAM: 8GB
 - OS: Lubuntu 22.04 LTS (5.15.0-60-generic linux kernel)
![image](graph.png)

As we can see, almost all of the Python game engines are beaten by Löve2D. Raylib and Pygame(GPU) showed close results, and at the start Löve2D(Normal) was almost beaten by Pygame(GPU), but with higher sprite count, the FPS on Pygame(GPU) was decreasing more than it did with Love2D.

## Conclusion
In the end, Love2D has beaten all of the Python libraries by a large amount.