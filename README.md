# Rock, Paper, Scissors (Dart)

Name: Ralph Matthew M. Ambray
Section: IT120/3rd Yr/ILFV3

## Description
A two-player, console-based Rock, Paper, Scissors game written in Dart for
IT 120 (Integrative Programming Technologies 2). The program uses null
safety throughout: all user input is read into nullable `String?` variables
and handled with `??` / null checks instead of the `!` operator.

## How to Run
1. Make sure the [Dart SDK](https://dart.dev/get-dart) is installed.
2. Run the program in a terminal (VS Code or Command Prompt) — **not**
   DartPad, since DartPad does not support `stdin` input:

   ```
   dart rock_paper_scissors.dart
   ```

## Features
- Title banner, player name prompts (with default names if left blank)
- Move validation (`rock`, `paper`, `scissors`), case-insensitive and
  whitespace-trimmed, re-prompts until valid
- Screen-clearing (30 blank lines) between Player 1's and Player 2's moves
- Winner logic via `switch` statement, draw handling with a nullable
  `winner` variable and `??`
- Running score display each round
- `do-while` loop for "play again?"
- Final score and overall winner at the end

## Notes on Null Safety

- All user input is read with `stdin.readLineSync()`, which returns
  `String?`. Every prompt result is stored in a nullable variable instead
  of being force-unwrapped with `!`.
- `getPlayerName()` treats a null or blank input as "no name entered" and
  falls back to a default label ("Player 1" / "Player 2") using `.trim()`
  and an `isEmpty` check rather than `!`.
- `validateMove()` returns `String?`: the normalized move if it's valid,
  or `null` if it isn't. `getMove()` loops, re-prompting the player, until
  `validateMove()` returns a non-null value.
- `decideWinner()` returns `String?` as well — it returns `null` when both
  moves are the same (a draw) instead of an empty string or a sentinel
  value.
- The draw message is produced with the null-coalescing operator:
  `winner ?? "It's a draw!"` — so the program only prints "It's a draw!"
  when `winner` is actually null.

## Game Rules

- Rock beats scissors, scissors beats paper, paper beats rock.
- Same move from both players = a draw, no point awarded.
- Winner of a round gets +1 to their score.
- Players keep playing rounds until they answer "n" to "Play again?".
- Whoever has the higher score when the game ends is the overall winner;
  equal scores result in a tie.
