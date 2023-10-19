<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>폭죽 애니메이션</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        canvas {
            border: 1px solid #000;
        }
    </style>
    <jsp:include page="./layout/head.jsp" />

</head>
<body>
<%--<jsp:include page="./layout/header.jsp" />--%>
<canvas id="fireworkCanvas" width="1500px" height="800px"></canvas>

<script>
    const canvas = document.getElementById('fireworkCanvas');
    const ctx = canvas.getContext('2d');

    // 폭죽을 그리는 함수
    function drawFirework(x, y) {
        const numParticles = 100;
        const particles = [];

        for (let i = 0; i < numParticles; i++) {
            const particle = {
                x,
                y,
                radius: Math.random() * 3 + 2,
                color: `rgb(${Math.random() * 255}, ${Math.random() * 255}, ${Math.random() * 255})`,
                speed: { x: (Math.random() - 0.5) * 8, y: (Math.random() - 0.5) * 8 }
            };
            particles.push(particle);
        }

        function draw() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);

            for (let i = 0; i < particles.length; i++) {
                const particle = particles[i];
                ctx.beginPath();
                ctx.arc(particle.x, particle.y, particle.radius, 0, Math.PI * 2);
                ctx.fillStyle = particle.color;
                ctx.fill();

                particle.x += particle.speed.x;
                particle.y += particle.speed.y;
                particle.radius *= 0.98; // Particle size decreases over time

                if (particle.radius < 0.5) {
                    particles.splice(i, 1);
                    i--;
                }
            }

            requestAnimationFrame(draw);
        }

        draw();
    }

    // 폭죽을 발사하는 함수
    function launchFirework() {
        const startX = Math.random() * canvas.width;
        const startY = canvas.height;
        drawFirework(startX, startY);
    }

    // 일정 간격으로 폭죽 발사
    setInterval(launchFirework, 2000); // Launch a firework every 2 seconds
</script>
</body>
</html>