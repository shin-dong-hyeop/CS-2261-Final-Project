# Bob's Breakout

Bob's Breakout is a three-level side-scrolling platformer for the Game Boy
Advance. Guide Bob through the forest, collect his banana and teddy bear, and
reach the crown without running out of lives.

## Gameplay

Each level has a different platform layout, collision map, parallax background,
collectible, and music track.

1. Collect the banana in Level 1.
2. Collect the teddy bear in Level 2.
3. Reach the crown in Level 3 to win.

Bob starts with three lives. Touching water or falling out of the playable area
costs one life and returns Bob to the start of the current level. The Bob icons
in the upper-left corner show the remaining lives.

## Controls

| Control | Action |
| --- | --- |
| Left / Right | Move Bob |
| A | Jump; press again in the air to double-jump |
| Hold R | Glide while falling |
| Start | Begin the game or pause/resume |
| B | View instructions without losing level progress |
| Select while paused | Return to the title screen |

Jump input is buffered briefly, and Bob can still jump for a few frames after
leaving a ledge. Releasing A early produces a shorter jump. The optional glide
strongly slows Bob's descent and changes how jumps can be routed, but it does
not disable collision or hazards.

### Default mGBA keyboard mapping

The controls above name the physical GBA buttons. With mGBA's default keyboard
configuration, use:

| GBA control | Keyboard key |
| --- | --- |
| D-pad | Arrow keys |
| A | X |
| B | Z |
| L shoulder | A |
| R shoulder / glide | S |
| Start | Enter |
| Select | Backspace |

Click the emulator window before playing so it has keyboard focus. To glide,
jump with X, release it, then hold S once Bob begins falling. The keyboard A
key is the unused GBA L shoulder button; it does not activate the glide.

## Technical overview

- GBA Mode 0 with two scrolling tile backgrounds
- Three 512x256 maps with pixel collision maps
- Animated player and collectibles using object attribute memory (OAM)
- Parallax horizontal scrolling
- Direct Sound music plus PSG sound effects
- Start, instructions, gameplay, pause, win, and lose states
- Reproducible source build; compiler intermediates are intentionally ignored

## Build and run

The included VS Code tasks use the course Docker image:

1. Start Docker Desktop.
2. Run the `run` task, or run `make clean all` in the configured GBA
   compiler container.
3. Open `my_project.gba` with mGBA.

The repository keeps editable BMP, PNG, TMX, TSX, and WAV assets alongside the
generated C/H data needed by the build. Object files, preprocessed sources,
assembly listings, emulator saves, and compiled ROMs are not versioned.

## Project structure

- `main.c` - state machine, screen setup, pause/resume, and music transitions
- `game.c` / `game.h` - player physics, animation, collectibles, HUD, and win flow
- `helper.c` / `helper.h` - collision-map queries and per-level update/draw wrappers
- `map*.{bmp,png,tmx,c,h}` - foreground level maps
- `background*.{bmp,c,h}` - parallax backgrounds
- `collision*.{bmp,c,h}` - solid, air, and hazard masks
- `spritesheet.*` - Bob, banana, teddy bear, and crown animation frames
- `*Music.{wav,c,h}` - title, level, and victory music

## Asset notes

Collision-map palette indices have gameplay meaning. Collision assets must be
exported as 8bpp data even when their editable BMP uses a smaller palette:

- `0` - solid terrain
- `1` - passable air
- `2` - passable hazard

When editing a level, regenerate the matching C/H asset files before rebuilding
the ROM so that the visual map and collision map remain synchronized.
