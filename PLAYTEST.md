# Bob's Breakout Playtest

Use this checklist for one complete playthrough. Record anything that feels
wrong even when the game technically works; movement feel matters as much as
correctness in a platformer.

## mGBA keyboard controls

Click the emulator window before testing so it receives keyboard input.

| GBA control | Keyboard key |
| --- | --- |
| D-pad | Arrow keys |
| A | X |
| B | Z |
| L shoulder | A |
| R shoulder / glide | S |
| Start | Enter |
| Select | Backspace |

## 1. Title and instructions

- Confirm that the title screen appears with music.
- Press Start and confirm that the instructions screen appears.
- Press Start again and confirm that Level 1 begins.

Expected: no flashing, corrupted tiles, missing music, or unexpected input.

## 2. Movement feel

- Walk left and right near the starting platform edges.
- Try a quick tap of A, a long press of A, and a double-jump.
- Walk off a ledge and press A immediately afterward to test coyote time.
- Press A shortly before landing to test jump buffering.
- Jump with X, release it, then hold S after Bob begins falling. His descent
  should become dramatically slower. Compare it with a fall where S is not held.
- Jump into the underside and sides of platforms.

Expected: short and long jumps feel distinct, buffered jumps trigger on
landing, Bob cannot pass through ceilings or walls, and gliding produces an
obviously slower fall without bypassing solid terrain.

## 3. Lives and hazards

- Confirm that three Bob icons appear in the upper-left corner.
- Touch water once and confirm that Bob respawns at the level start.
- Confirm that one life icon disappears.
- Lose all three lives and confirm that the lose screen appears.
- Press Start or Select and confirm that the title screen returns with three
  lives restored.

Expected: exactly one life is lost per hazard contact and no stale sprites
remain on the lose screen.

## 4. Pause and instructions

- Move halfway through a level and press Start.
- Resume with Start and confirm that Bob returns to the same location.
- Press B during gameplay, then Start on the instructions screen.
- Confirm that Bob again returns to the same location.
- Pause and press Select to return to the title screen.

Expected: pause and instructions do not restart the current level; returning to
the title intentionally resets the run.

## 5. Three-level progression

- Collect the banana in Level 1.
- Confirm that Level 2 loads with its own forest background and music.
- Collect the teddy bear in Level 2.
- Confirm that Level 3 uses its own map, background, collision, and music.
- Reach the crown and confirm that the win screen and victory music appear.
- Press Start or Select and confirm that a new run can begin normally.

Expected: no Level 2 artwork appears in Level 3, collectibles animate, and each
transition happens only once.

## Feedback template

Copy this block when reporting a problem:

```text
Level/state:
What I was doing:
What happened:
What I expected:
Does it happen every time?:
Movement too slow/fast/heavy/floaty?:
Screenshot or recording, if available:
```
