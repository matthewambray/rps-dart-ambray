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
