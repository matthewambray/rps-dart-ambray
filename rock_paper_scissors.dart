import 'dart:io';

// the three moves that actually count, everything else is invalid
const List<String> moves = ['rock', 'paper', 'scissors'];

/// Prompts for a player's name. If they just hit enter, falls back to
/// [defaultName] instead of crashing on a null value.
String getPlayerName(String label, String defaultName) {
  stdout.write('Enter $label name: ');
  String? raw = stdin.readLineSync();
  String giprosesoNgaInput = raw == null ? '' : raw.trim();

  if (giprosesoNgaInput == '') {
    print('(No name entered. Using "$defaultName".)');
    return defaultName;
  }
  return giprosesoNgaInput;
}

/// Checks whether [raw] is one of rock/paper/scissors once trimmed and
/// lowercased. Returns null instead of throwing when it isn't -- caller
/// decides what to do about that.
String? validateMove(String? raw) {
  if (raw == null) return null;
  String move = raw.trim().toLowerCase();
  if (moves.contains(move)) {
    return move;
  }
  return null;
}

/// Keeps nagging [playerName] for a move until validateMove stops
/// returning null.
String getMove(String playerName) {
  String? move;
  while (move == null) {
    stdout.write('$playerName, enter your move (rock/paper/scissors): ');
    move = validateMove(stdin.readLineSync());
    if (move == null) {
      print('Invalid move. Please type rock, paper, or scissors.');
    }
  }
  return move;
}

/// Prints a bunch of blank lines so player two can't just read player
/// one's move off the screen.
void clearScreen() {
  for (var i = 0; i < 30; i++) {
    print('');
  }
}

/// Compares the two moves and says who took the round. Returns 0 for a
/// draw so the caller can turn that into a null "winner" if it wants.
int decideWinner(String p1Move, String p2Move) {
  if (p1Move == p2Move) return 0;

  switch (p1Move) {
    case 'rock':
      return p2Move == 'scissors' ? 1 : 2;
    case 'paper':
      return p2Move == 'rock' ? 1 : 2;
    case 'scissors':
      return p2Move == 'paper' ? 1 : 2;
    default:
      // shouldn't happen, moves are validated before this is called
      return 0;
  }
}

void main() {
  print('===== ROCK, PAPER, SCISSORS =====');

  String p1Name = getPlayerName('Player 1', 'Player 1');
  String p2Name = getPlayerName('Player 2', 'Player 2');

  int p1Score = 0;
  int p2Score = 0;
  int roundNumber = 1;
  String? dulaUtro;

  do {
    print('\n--- Round $roundNumber ---');

    String p1Move = getMove(p1Name);
    clearScreen();
    String p2Move = getMove(p2Name);

    int resulta = decideWinner(p1Move, p2Move);

    // null means draw -- printed later with ??
    String? roundWinner;
    if (resulta == 1) {
      roundWinner = '$p1Name wins the round!';
      p1Score++;
    } else if (resulta == 2) {
      roundWinner = '$p2Name wins the round!';
      p2Score++;
    }

    print('$p1Name chose $p1Move. $p2Name chose $p2Move.');
    print('resulta: ${roundWinner ?? "It's a draw!"}');
    print('Score -> $p1Name: $p1Score | $p2Name: $p2Score');

    stdout.write('Play again? (y/n): ');
    dulaUtro = stdin.readLineSync();
    roundNumber++;
  } while ((dulaUtro ?? 'n').trim().toLowerCase() != 'n');

  print('\n===== FINAL SCORE =====');
  print('$p1Name: $p1Score | $p2Name: $p2Score');

  String? overallNaDaog;
  if (p1Score > p2Score) overallNaDaog = p1Name;
  if (p2Score > p1Score) overallNaDaog = p2Name;

  print('Overall winner: ${overallNaDaog ?? "It's a draw!"}');
}