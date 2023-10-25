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
<a href="${path }/" class="navbar-brand font-weight-bold text-secondary" style="font-size: 50px"><span class="text-primary">
            <img src="${path}/resources/image/common/logo_main.png" alt="해법로고">
        </span></a>
  <h2>수강생 여러분, 잠시 쉬어가세요!</h2><br>
  <h1>SHOOTING GAME</h1>
  <h3>move : → ↑ ← ↓  &nbsp;&nbsp;|&nbsp;&nbsp;  attack : spacebar</h3>

  <canvas id="gameCanvas" width="800" height="400"></canvas><br>
  <div id="gameOverText" style="display: none;">GAME OVER</div>
  <div id="score">Score: 0</div>
  <div id="timer">게임 시간 : 1분</div> <!-- 타이머 추가 -->
  <a href="${path}/">메인으로 이동</a>
</body>
  <script>
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
      x: 20,
      y: canvas.height / 2,
      width: 64,
      height: 64,
      speed: 30, // 이동 속도 조정
      acceleration: 10, // 가속도 추가
      maxSpeed: 40, // 최대 이동 속도 설정
    };

    const bullets = [];
    const enemies = [];
    let gameover = false;
    let score = 0;
    const scoreElement = document.getElementById("score");
    const gameOverText = document.getElementById("gameOverText");

    const gameStartTime = Date.now();
    let gameDuration = 60; // 게임 지속 시간 (초)
    let keyState = {};
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
      const remainingTime = Math.max(0, gameDuration - elapsedTime);
      const minutes = Math.floor(remainingTime / 60);
      const seconds = remainingTime % 60;
      document.getElementById("timer").textContent = `${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;

      if (remainingTime <= 0) {
        endGame();
      }
    }

    function update() {
      if (gameover) {
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        ctx.fillStyle = "black";
        ctx.font = "40px Arial";
        ctx.fillText("GAME OVER", canvas.width / 2 - 80, canvas.height / 2 - 40);
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

      if (enemies.length === 0) {
        spawnEnemy();
      }

      enemies.forEach((enemy, index) => {
        if (
                player.x < enemy.x + enemy.width &&
                player.x + player.width > enemy.x &&
                player.y < enemy.y + enemy.height &&
                player.y + player.height > enemy.y
        ) {
          endGame();
        }

        if (enemy.x + enemy.width < 0) {
          enemies.splice(index, 1);
        }
      });

      updateTimer();

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
        y: Math.floor(Math.random() * (canvas.height - 50)),
        width: 50,
        height: 50,
        speed: 6,
      };
      enemies.push(enemy);

      // 30초가 지나면 enemy를 더 자주 생성
      if (gameDuration < 30) {
        setTimeout(spawnEnemy, 500); // 0.5초마다 enemy 생성
      } else {
        setTimeout(spawnEnemy, 2000); // 2초마다 enemy 생성
      }
    }


    document.addEventListener("keydown", (e) => {
      if (gameover) {
        return;
      }

      switch (e.key) {
        case "ArrowUp":
          if (player.y > 0) {
            player.y -= player.speed;
          }
          break;
        case "ArrowDown":
          if (player.y + player.height < canvas.height) {
            player.y += player.speed;
          }
          break;
        case "ArrowLeft":
          if (player.x > 0) {
            player.x -= player.speed;
          }
          break;
        case "ArrowRight":
          if (player.x + player.width < canvas.width) {
            player.x += player.speed;
          }
          break;
        case " ":
          bullets.push({
            x: player.x + player.width,
            y: player.y + player.height / 7,
            width: 50,
            height: 50,
            speed: 8 ,
          });
          break;
      }
    });




    function updateScore() {
      scoreElement.innerHTML = "Score: " + score;
    }

    spawnEnemy();
    update();
  </script>

</html>
