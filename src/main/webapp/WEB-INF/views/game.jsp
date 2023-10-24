<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>HEABEOP::게임</title>
  <jsp:include page="./layout/head.jsp" />
  <link rel="stylesheet" href="${path }/resources/css/sub.css">
  <style>
    body {
      padding-top: 100px;
      text-align: center;
      background-color: #f0f0f0;
      margin: 0;
    }

    #gameCanvas {
      border: 2px solid black;
      display: block;
      margin: 0 auto;
    }
  </style>
</head>
<body>
<div class="container-fluid mb-5 intro">
  <h3>수강생 여러분, 잠시 쉬어가세요!</h3><br>
  <h1>SHOOTING GAME</h1>
  <p>move : ↑ ↓  &nbsp;&nbsp;|&nbsp;&nbsp;  attack : spacebar</p>
  <canvas id="gameCanvas" width="800" height="400"></canvas>
  <div id="score">Score: 0</div>
  <div id="gameOverText" style="display: none;">GAME OVER</div>
  <div id="timer">게임시간 1분</div> <!-- 타이머 추가 -->
  <button id="restartButton btn btn-primary" style="display: none; margin: 0 auto">다시 시작</button>
  <a href="${path}/">메인으로 이동</a>
</div>
</body>
<script>
const restartButton = document.getElementById("restartButton");
restartButton.addEventListener("click", () => {
  restartGame();
});

function restartGame() {
  // 게임 변수 및 상태를 초기화합니다.
  gameover = false;
  score = 0;
  timeLeft = 60;
  bullets.length = 0;
  enemies.length = 0;

  // 다시 시작 버튼을 숨깁니다.
  restartButton.style.display = "none";

  // 게임을 다시 시작합니다.
  spawnEnemy();
  update();
}
const canvas = document.getElementById("gameCanvas");
const ctx = canvas.getContext("2d");

const playerImage = new Image();
playerImage.src = "${path}/resources/image/sub/player.png";

const bulletImage = new Image();
bulletImage.src = "${path}/resources/image/sub/bullet.png";

const enemyImage = new Image();
enemyImage.src = "${path}/resources/image/sub/enemy.png";

const backgroundImage = new Image();
backgroundImage.src = "${path}/resources/image/sub/background.jpg";

const player = {
  x: 50,
  y: canvas.height / 4,
  width: 64,
  height: 64,
  speed: 10,
};

const bullets = [];
const enemies = [];
let gameover = false;
let score = 0;
const scoreElement = document.getElementById("score");
const gameOverText = document.getElementById("gameOverText");

const gameStartTime = Date.now();
let timeLeft = 60;

function drawPlayer() {
  ctx.drawImage(playerImage, player.x, player.y, player.width, player.height);
}

function drawBullets() {
  bullets.forEach((bullet) => {
    ctx.drawImage(bulletImage, bullet.x, bullet.y, bullet.width, bullet.height);
  });
}

function drawEnemies() {
  enemies.forEach((enemy) => {
    ctx.drawImage(enemyImage, enemy.x, enemy.y, enemy.width, enemy.height);
  });
}

function drawBackground() {
  ctx.drawImage(backgroundImage, 0, 0, canvas.width, canvas.height);
}

function updateTimer() {
  const elapsedTime = Math.floor((Date.now() - gameStartTime) / 1000);
  const remainingTime = Math.max(0, timeLeft - elapsedTime);
  const minutes = Math.floor(remainingTime / 60);
  const seconds = remainingTime % 60;
  document.getElementById("timer").textContent = `Time Left: ${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
}

function update() {
  if (gameover) {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.fillStyle = "black";
    ctx.font = "30px Arial";
    ctx.fillText("Game Over", canvas.width / 2 - 80, canvas.height / 2 - 20);
    ctx.fillText("Score: " + score, canvas.width / 2 - 50, canvas.height / 2 + 20);
    gameOverText.style.display = "block";
    return;
  }

  drawBackground();
  drawPlayer();
  drawBullets();
  drawEnemies();

  bullets.forEach((bullet) => {
    bullet.x += bullet.speed;
  });

  enemies.forEach((enemy) => {
    enemy.x -= enemy.speed;
  });

  bullets.forEach((bullet, bulletIndex) => {
    enemies.forEach((enemy, enemyIndex) => {
      if (
              bullet.x < enemy.x + enemy.width &&
              bullet.x + bullet.width > enemy.x &&
              bullet.y < enemy.y + enemy.height &&
              bullet.y + bullet.height > enemy.y
      ) {
        bullets.splice(bulletIndex, 1);
        enemies.splice(enemyIndex, 1);
        score += 10;
        updateScore();
      }
    });
  });

  if (player.y < 0 || player.y + player.height > canvas.height) {
    endGame();
  }

  updateTimer();

  if (timeLeft <= 0) {
    endGame();
  }

  if (enemies.length === 0) {
    spawnEnemy();
  }

  enemies.forEach((enemy) => {
    if (
            player.x < enemy.x + enemy.width &&
            player.x + player.width > enemy.x &&
            player.y < enemy.y + enemy.height &&
            player.y + player.height > enemy.y
    ) {
      endGame();
    }
  });

  requestAnimationFrame(update);
}

function endGame() {
  gameover = true;
  updateScore();
  gameOverText.style.display = "block";
}

function spawnEnemy() {
  const enemy = {
    x: canvas.width,
    y: Math.floor(Math.random() * canvas.height),
    width: 64,
    height: 64,
    speed: 4,
  };
  enemies.push(enemy);
}

document.addEventListener("keydown", (e) => {
  if (gameover) {
    return;
  }

  if (e.key === " ") {
    bullets.push({
      x: player.x + player.width,
      y: player.y + player.height / 4,
      width: 30,
      height: 30,
      speed: 5,
    });
  }
});

document.addEventListener("keydown", (e) => {
  if (gameover) {
    return;
  }

  if (e.key === "ArrowUp" && player.y > 0) {
    player.y -= player.speed;
  }
});

document.addEventListener("keydown", (e) => {
  if (gameover) {
    return;
  }

  if (e.key === "ArrowDown" && player.y + player.height < canvas.height) {
    player.y += player.speed;
  }
});

function updateScore() {
  scoreElement.innerHTML = "Score: " + score;
}

spawnEnemy();
update();

// 게임 종료 시 "다시 시작" 버튼을 표시합니다.
function endGame() {
  gameover = true;
  updateScore();
  gameOverText.style.display = "block";
  restartButton.style.display = "block";
}
</script>

</html>
