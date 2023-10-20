
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>폭죽 애니메이션</title>
    <style>
        *   {
            background-color: black;
        }
        body {
            /*display: flex;*/
            /*justify-content: center;*/
            align-items: center;
            margin: 0;
        }
        canvas {
            border: none;
            background-color: black;
            border-radius: 35%;
            width: 350px;
            height: auto;

        }

        img {
            margin: 0;
            padding: 0;
            position: absolute;
            z-index: 1100;
            top: 20%;
            left:50%;
        }
    </style>
    <jsp:include page="./layout/head.jsp" />

</head>
<body>
<%--<jsp:include page="./layout/header.jsp" />--%>
<canvas id="fireworkCanvas" width="5000px" height="1000px"></canvas>
<img src="${path}/resources/image/main/congpoint.png" alt="축하 포인트 ">
<script>
    const canvas = document.getElementById('fireworkCanvas');
    const ctx = canvas.getContext('2d');

    // 폭죽을 그리는 함수
    function drawFirework(x, y) {
        const numParticles = 1500;
        const particles = [];

        for (let i = 0; i < numParticles; i++) {
            const particle = { x, y,
                radius: Math.random() * 3 + 2,
                color: `rgb(193, 26, 26)`,
                speed: { x: (Math.random() - 0.5) * 8, y: (Math.random() - 0.5) * 8 }
            };
            particles.push(particle);
        }

        function draw() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);

            for (let i = 0; i < particles.length; i++) {
                const particle = particles[i];
                ctx.beginPath();
                ctx.arc(particle.x, particle.y, particle.radius, 0, Math.PI * 5);
                ctx.fillStyle = particle.color;
                ctx.fill();

                particle.x += particle.speed.x;
                particle.y += particle.speed.y;
                particle.radius *= 0.98; // Particle size decreases over time

                if (particle.radius < 0.5) {
                    particles.splice(i, 3);
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
    setInterval(launchFirework, 1500); // Launch a firework every 2 seconds
</script>
</body>
</html>