import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isTrueO = true;
  bool gameHasResult = false;

  List<String> xORoList = ['', '', '', '', '', '', '', '', ''];

  int filledBox = 0;
  int playerO = 0;
  int playerX = 0;

  String winnerTitle = '';
  String gameResultVar = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tik Tak Toe"),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
              onPressed: () {
                resetGame();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            getScoreBoard(),
            SizedBox(height: 30),
            winnerResult(),
            SizedBox(height: 12),
            getGridView(),
            getTurn(),
          ],
        ),
      ),
    );
  }

  Widget getScoreBoard() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Player O",
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "${playerO}",
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "Player X",
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  "${playerX}",
                  style: TextStyle(fontSize: 23, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget winnerResult() {
    return Visibility(
      visible: gameHasResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          textStyle: TextStyle(fontSize: 23, fontWeight: FontWeight.normal),
          foregroundColor: Colors.white,
          side: BorderSide(color: Colors.white, width: 2),
        ),
        onPressed: () {
          gameHasResult = false;
          resetGame();
        },
        child: Text(
          '$winnerTitle',
        ),
      ),
    );
  }

  Widget getGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              child: Center(
                child: Text(
                  '${xORoList[index]}',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: xORoList[index] == "O" ? Colors.white : Colors.red,
                      fontSize: 38,
                      fontWeight: FontWeight.bold),
                ),
              ),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }

  tapped(int index) {
    if (gameHasResult) {
      return;
    }

    setState(() {
      if (xORoList[index].length != 0) {
        return;
      }
      if (isTrueO) {
        xORoList[index] = "O";
        filledBox += 1;
      } else {
        xORoList[index] = "X";
        filledBox += 1;
      }
      isTrueO = !isTrueO;
      checkWinner();
    });
  }

  Widget getTurn() {
    return Text(
      isTrueO ? 'Turn O' : 'Turn X',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  void checkWinner() {
    if (xORoList[0] == xORoList[1] &&
        xORoList[0] == xORoList[2] &&
        xORoList[0] != '') {
      //print("Winner is: ${xORoList[0]}");
      gameResult(xORoList[0], "Winner is: ${xORoList[0]}");
      return;
    }
    if (xORoList[3] == xORoList[4] &&
        xORoList[3] == xORoList[5] &&
        xORoList[3] != '') {
      //print("Winner is: ${xORoList[3]}");
      gameResult(xORoList[3], "Winner is: ${xORoList[3]}");
      return;
    }
    if (xORoList[6] == xORoList[7] &&
        xORoList[6] == xORoList[8] &&
        xORoList[6] != '') {
      //print("Winner is: ${xORoList[6]}");
      gameResult(xORoList[6], "Winner is: ${xORoList[6]}");
      return;
    }
    if (xORoList[0] == xORoList[3] &&
        xORoList[0] == xORoList[6] &&
        xORoList[0] != '') {
      //print("Winner is: ${xORoList[0]}");
      gameResult(xORoList[0], "Winner is: ${xORoList[0]}");
      return;
    }
    if (xORoList[1] == xORoList[4] &&
        xORoList[1] == xORoList[7] &&
        xORoList[1] != '') {
      //print("Winner is: ${xORoList[1]}");
      gameResult(xORoList[1], "Winner is: ${xORoList[1]}");
      return;
    }
    if (xORoList[2] == xORoList[5] &&
        xORoList[2] == xORoList[8] &&
        xORoList[2] != '') {
      //print("Winner is: ${xORoList[4]}");
      gameResult(xORoList[4], "Winner is: ${xORoList[4]}");
      return;
    }
    if (xORoList[0] == xORoList[4] &&
        xORoList[0] == xORoList[8] &&
        xORoList[0] != '') {
      //print("Winner is: ${xORoList[0]}");
      gameResult(xORoList[0], "Winner is: ${xORoList[0]}");
      return;
    }
    if (xORoList[2] == xORoList[4] &&
        xORoList[2] == xORoList[6] &&
        xORoList[2] != '') {
      //print("Winner is: ${xORoList[2]}");
      gameResult(xORoList[2], "Winner is: ${xORoList[2]}");
      return;
    }

    if (filledBox == 9) {
      //gameResult('', "Winner is: ${winnerTitle}");
      print("equal");

      return;
    }
  }

  void gameResult(String winner, String title) {
    setState(() {
      gameHasResult = true;
      winnerTitle = title;
      if (winner == "O") {
        playerO += 1;
      } else if (winner == "X") {
        playerX += 1;
      } else {
        winnerTitle = "Draw";
      }
    });
  }

  void resetGame() {
    setState(
      () {
        for (int i = 0; i < xORoList.length; i++) {
          xORoList[i] = '';
        }
      },
    );

    filledBox = 0;
  }
}
