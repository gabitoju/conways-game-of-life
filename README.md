# Conway's Game of Life

This is a simple implementation of Conway's Game of Life written in Ruby.

## Requirements

- Ruby

## How to Run

To run the simulation, execute the `main.rb` file from your terminal:

```bash
ruby main.rb
```

## How to Play

When you start the application, you will be prompted to choose a world type and set a generation delay.

### World Types

You can choose from the following starting patterns:

-   **D - Default:** A small, stable pattern.
-   **G - Glider:** A classic "spaceship" pattern that moves across the grid.
-   **R - Random:** A randomly generated world.
    -   If you choose this option, you will be asked to provide a density value (a number between 0.0 and 1.0) to determine how many cells start alive. You can also press Enter to use the default density of 0.25.

### Generation Delay

After selecting the world type, you will be asked to enter a delay in seconds. This value determines how long the program will pause between each generation, controlling the speed of the simulation.

## Exiting the Game

The simulation will end automatically if the population of living cells reaches zero. You can also exit the game at any time by pressing `Ctrl+C`.
