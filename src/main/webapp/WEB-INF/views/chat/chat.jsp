<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HEABEOP::서브</title>
    <jsp:include page="../layout/head.jsp" />
    <link rel="stylesheet" href="${path }/resources/css/sub.css">
    <script src="${path}/resources/js/socket.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="../layout/header.jsp" />
    <div class="container-fluid bg-primary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
            <h3 class="display-3 font-weight-bold text-white">해법 톡톡</h3>
            <div class="d-inline-flex text-white">
                <p class="m-0"><a class="text-white" href="${path }/">Home</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0"><a class="text-white" href="#">해법 톡톡</a></p>
                <p class="m-0 px-2">/</p>
                <p class="m-0">해법 톡톡</p>
            </div>
        </div>
    </div>

    <div class="container-fluid mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height:50vh">
            <%-- 콘텐츠 시작 --%>
            <div class="container">
                <div class="row">
                    <%--  채팅방 목록 --%>
                    <div class="col-6">
                        <h4>채팅방 목록</h4>
                        <ul class="list-group" id="roomList" style="margin: 10px 0;">
                            <c:forEach var="room" items="${chatRooms}">
                                <li class="list-group-item" data-roomid="${room.roomId}"><a href="javscript:joinRoom(${room.roomId})">${room.name}</a></li>
                            </c:forEach>
                        </ul>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Chat Room Name" aria-label="Chat Room Input" id="roomName">
                            <button class="btn btn-outline-secondary" onclick="createRoom()">Create Chat Room</button>
                        </div>
                    </div>

                    <%--    Chat Room--%>
                    <div class="col-6">
                        <section style="background-color: #eee;">
                            <div class="container py-5">
                                <div class="row d-flex justify-content-center">
                                    <div class="col">

                                        <div class="card" id="chat1" style="border-radius: 15px;">
                                            <div class="card-header d-flex justify-content-between align-items-center p-3 bg-info text-white border-bottom-0" style="border-top-left-radius: 15px; border-top-right-radius: 15px;">
                                                <i class="fas fa-angle-left"></i>
                                                <p class="mb-0 fw-bold" id="roomId">Live chat</p>
                                                <i class="fas fa-times"></i>
                                            </div>

                                            <div class="card-body">
                                                <div id="chat-msg-list">
                                                    <div class="d-flex flex-row justify-content-start mb-4">
                                                        <div class="row p-3">
                                                            <%--                                                <p class="chat-author m-0">user1</p>--%>
                                                            <div class="p-3" style="border-radius: 15px; background-color: rgba(57, 192, 237,.2);">
                                                                <p class="small mb-0">Hello and thank you for visiting MDBootstrap. Please click the video below.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-outline">
                                                    <div class="row">
                                                        <div class="col-10">
                                                            <textarea class="form-control" id="chat-text-input" placeholder="Type Your message" aria-label="chat input" rows="3"></textarea>
                                                        </div>
                                                        <div class="col">
                                                            <button class="btn btn-primary" id="btnSend">Send</button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="../layout/footer.jsp" />
</body>
</html>

<script>
    const websocket = new WebSocket("ws://localhost:8081/ws/chat");

    let createRoom = function(){
        let data = {"roomName": $("#roomName").val()};
        $.ajax({
            type: "POST",
            url: "${path}/chat/createRoom",
            data: JSON.stringify(data), // 파라미터로 채팅방 이름 전달
            contentType: "application/json", // 데이터의 유형을 JSON으로 설정
            success: function (room) {
                let newRoom = `<li class="list-group-item" data-roomid="\${room.roomId}"><a href="javscript:joinRoom(\${room.roomId})">\${room.name}</a></li>`;

                $("#roomList").append(newRoom); // 채팅방 생성 성공 시 새로운 채팅방을 목록에 추가
                $("#roomName").val(""); // 입력 필드 초기화
            },
            error: function(res){
                console.log("error"+res);
            }
        });
    };
    
    let joinRoom = function(roomId){
        let data = {"roomId": roomId};
        $.ajax({
            type: "GET",
            url: "${path}/chat/joinRoom",
            data: JSON.stringify(data), // 파라미터로 채팅방 이름 전달
            contentType: "application/json", // 데이터의 유형을 JSON으로 설정
            success: function (room) {
                console.log(room.roomId);
            },
            error: function(res){
                console.log("error"+res);
            }
        })
    };
</script>