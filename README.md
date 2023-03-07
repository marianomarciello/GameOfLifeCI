# Game Of Life (CI)

Implementation of [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) in ruby.
The input generation is provided in the "./input.txt" file.

## Run

```
ruby gameOfLife.rb
```

```
Generation: 3
4 8
........
....*...
...**...
........
n) next generation
q) quit
```

Type `n` to view the next generation or type `q` to exit the program.

## Structure
* gameOfLife.rb: main file.
* generation.rb: contains the Generation class.
* parsing.rb: contains a function called parseFile that is used to parse and validate an input file.

