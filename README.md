**Project:**   
**Author:** Donghyeop Shin

## What’s finished (M01)
- ✅ Full state machine implemented:
  - START → INSTRUCTIONS → GAME → PAUSE → WIN/LOSE (and back to START)
- ✅ START and PAUSE use Mode 0 tile backgrounds (assets: `start.*`, `pause.*`)
- ✅ GAME runs in **Mode 0** with hooks into `game.c`:
  - `initGame()` – sets up tiles/map/sprites
  - `gameUpdate()` – handles input, physics, collisions
  - `gameDraw()` – draws player/sprites and any scrolling
- ✅ INSTRUCTIONS / WIN / LOSE are implemented as distinct placeholder screens
  (solid colors in Mode 3) to clearly differentiate states.
- ✅ Button navigation between all states (see Controls below)

## What still needs to be added (next milestones)
- Core movement tuning (accel/friction/jump feel)
- Final collision map and scrolling camera
- Enemy entities + patterns (stretch for M01; required later)
- Obstacles (e.g., water/pits, moving platforms)
- Win/Lose conditions tied to gameplay (currently mapped to shoulder buttons for demo)
- Sprite animation (player + at least one other animated sprite)
- Sound effects & music (at least two sounds)
- Cheat mechanic that adds a new way to play (not trivializes difficulty)
- Polish: HUD, score/health, transitions, art pass

## Known bugs / notes
- (If applicable) Pause screen art occasionally misaligns on some builds — likely a stale map/charblock issue. Using separate SBB for PAUSE mitigates it.
- Placeholders are used for non-critical screens to prioritize gameplay.
- Add any other issues you’ve noticed here.

## How to play / navigate (for TA)
- **START screen**
  - `START` → GAME
  - `SELECT` → INSTRUCTIONS
- **INSTRUCTIONS screen**
  - `START` → GAME
  - `B` → START
- **GAME**
  - D-pad to move (demo)
  - `START` → PAUSE
  - `L` → LOSE (demo trigger to show state)
  - `R` → WIN (demo trigger to show state)
- **PAUSE**
  - `START` → GAME (resume)
  - `SELECT` → START (restart)
- **WIN / LOSE**
  - `START` or `SELECT` → START

## Build & Run
- Clean, build, and run as usual for class template.
- Submission zip should include all sources and the compiled `.gba`:
  `M01_ShinDonghyeop.zip`

## File Structure (key files)
- `main.c` – state machine & screen transitions (Mode 0/3 as appropriate)
- `game.c/.h` – gameplay core (`initGame`, `gameUpdate`, `gameDraw`)
- `mode0.c/.h`, `gba.c/.h`, `print.c/.h` – course utilities
- `start.c/.h`, `pause.c/.h` – tile assets for START/PAUSE

## TA Feedback addressed (from M00)
- Implemented state machine across required screens.
- Began core gameplay hook: Mode 0 GAME with movement/collision to be tuned.
- Using placeholders to focus on mechanics first (per guidance).
