//: [Previous](@previous)
/*:
# Assignment: Snake & Ladders
Now that you've got some idea how Swift looks like, it's time for you to get your hands dirty doing the first Swift assignment.

Build a simple Snake & Ladders game. You'll need to have some game setup function, which keeps a board of 100 squares. Some of the squares are "Snakes", meaning that a player who lands on the square will fall back a number of positions. Some of the squares are "Ladders", where a player who lands there will go forward a number of positions. The goal, is to be the first to reach the 100th square. You can set the number of players as a variable, anything between 2 to 5 makes a good number.

The main loop will basically roll the dice for each player, and print out the their current position, rolled dice, new position, and effect of landing on a snake or ladder.

No user input is expected for this simple assignment. The program just has to keep on running until one player reaches the goal.
*/
import Foundation

class Player {
    var playerName: String
    var playerPosition: Int
    
    init(playerName: String, playerPosition: Int = 0){
        self.playerName = playerName
        self.playerPosition = playerPosition
    }
}

class Board {
    var totalSquare: Int
    var noOfDice: Int
    var boardArray: [Int]
    
    init(totalSquare: Int, noOfDice: Int, board: [Int]) {
        self.totalSquare = totalSquare
        self.noOfDice = noOfDice
        self.boardArray = board
    }
    
    func initBoard() {
        boardArray = [Int](count: totalSquare + 1, repeatedValue:0)
    }
    
    func initSnakeLadder(index: Int, number: Int){
        boardArray[index] = number
    }
}



class SnakeLadderGame {
    var players: [Player]
    var boards: Board
    
    init(players: [Player], boards: Board) {
        self.players = players
        self.boards = boards
    }
    
    func rollDice() -> Int {
        // Generate a random number between 1 to 6
        // Hint: use the rand() function to get a random number, then limit it to between 1 to 6
        return (Int(arc4random_uniform(UInt32(6))) + 1)
    }
    
    // Pass it a player number, rolled dice, etc
    // and print out a description of the move
    func printStep(diceValue: Int, currentPosition: Int, playerName: String) {
        print("Dice number \(diceValue): \(playerName) is on square number \(currentPosition)")
    }
    
    func start() {
        var hasWinner: Bool = false
        
        while (!hasWinner) {
            // For each player, find the current position, roll the dice,
            // set the new position based on the board's snakes and ladders
            // print out the move
            
            for player:Player in players { //loop through the array value instead of index
                let diceValue : Int = rollDice()
                let currentPlayerPosition = diceValue + boards.boardArray[diceValue]
                
                player.playerPosition += currentPlayerPosition
                
                printStep(diceValue, currentPosition: player.playerPosition, playerName: player.playerName)
                //print("\(board.count)")
                // Check for winners
                if (player.playerPosition >= boards.totalSquare - 1){
                    // Repeat until winner is found
                    hasWinner = true
                    print("Winner is \(player.playerName)")
                    break;
                }
            }
        }
    }
}


var player1: Player = Player(playerName: "Player 1")
var player2: Player = Player(playerName: "Player 2")

var boardGame: Board = Board(totalSquare: 100, noOfDice: 1, board: [Int]())
boardGame.initBoard();
boardGame.initSnakeLadder(10, number: +8)
boardGame.initSnakeLadder(20, number: +10)
boardGame.initSnakeLadder(50, number: -20)
boardGame.initSnakeLadder(70, number: -10)
boardGame.initSnakeLadder(80, number: +8)
boardGame.initSnakeLadder(90, number: -10)

var playerArray : [Player] = []
playerArray.append(player1)
playerArray.append(player2)

var game: SnakeLadderGame = SnakeLadderGame(players: playerArray, boards: boardGame)
game.start()




















//: [Next](@next)