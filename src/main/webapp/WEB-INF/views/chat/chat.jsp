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
    <style>
        .chat-box {
            margin: 0;
        }
        .chat-time {
            display: inline;
            margin-left: 10px;
            color: gray;
            font-size: 10px;
        }
        .close-tag {
            color: inherit;
        }
    </style>
</head>
<body>
    <jsp:include page="../layout/header.jsp" />
    <div class="container-fluid bg-primary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 400px">
            <h3 class="display-3 font-weight-bold text-white">해법 톡톡</h3>
            <div class="d-inline-flex text-white">
                <p class="m-0"><a class="text-white" href="${path}/">Home</a></p>
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
                            <c:forEach var="data" items="${chatRooms}">
                                <li class="list-group-item"><a href="javascript:joinRoom('${data.roomId}')" id="${data.roomId}" data-name="${data.name}">${data.name}</a></li>
                            </c:forEach>
                        </ul>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Chat Room Name" aria-label="Chat Room Input" id="roomName">
                            <button class="btn btn-outline-secondary" onclick="createRoom()">Create Chat Room</button>
                        </div>
                    </div>

                    <%--    Chat Room--%>
                    <div id="chatRoom" class="col-6" style="visibility: hidden;">
                        <section style="background-color: #eee;">
                            <div class="container py-5">
                                <div class="row d-flex justify-content-center">
                                    <div class="col">

                                        <div class="card" style="border-radius: 15px;">
                                            <div class="card-header d-flex justify-content-between align-items-center p-3 bg-info text-white border-bottom-0" style="border-top-left-radius: 15px; border-top-right-radius: 15px;">
                                                <i class="fas fa-angle-left"></i>
                                                <p class="mb-0 fw-bold" id="chatRoomName">Live chat</p>
                                                <a id="close-btn" class="close-tag"><i class="fas fa-times"></i></a>
                                            </div>

                                            <div class="card-body">
                                                <div id="msgArea" style="height: 500px; overflow-y: auto;">
                                                </div>

                                                <textarea class="form-control" id="chat-input" placeholder="Type Your message and Enter" aria-label="chat input" rows="3"></textarea>
                                                <div class="d-flex justify-content-end mt-2"><button class="btn btn-primary" id="chat-send">Send</button></div>
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



<script>
    let websocket;

    let createRoom = function(){
        let roomName = $("#roomName").val();

        if(roomName==="") {return false;}
        $.ajax({
            type: "POST",
            url: "${path}/chat/createRoom",
            data: { name: roomName }, // 파라미터로 채팅방 이름 전달
            success: function (data) {
                let newRoom = `<li class="list-group-item"><a href="javascript:joinRoom('\${data.roomId}')" id="\${data.roomId}" data-name="\${data.name}">\${data.name}</a></li>`;
                $("#roomList").append(newRoom);
                $("#roomName").val(""); // 입력 필드 초기화
            }
        });
    }

    let joinRoom = function(roomId) {
        closeRoom();
        const atag = document.getElementById(roomId);
        let roomName = atag.getAttribute("data-name");

        $("#chatRoom").css("visibility", "visible");
        let username = <%=session.getAttribute("sid")%>;
        if (username == null) {
            username = "guest";
        }

        const websocket = new WebSocket("ws://localhost:8081/team44_war/ws/chat");
        websocket.onmessage = onMessage;
        websocket.onopen = onOpen;
        websocket.onclose = onClose;

        function websocketsend(type, roomId, username, message){
            var currentTime = new Date();
            var options = { year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' };
            var time = new Intl.DateTimeFormat('ko-KR', options).format(currentTime);

            let chat = {
                "type": type,
                "roomId": roomId,
                "sender": username,
                "message": message,
                "time": time
            };

            var jsonstr = JSON.stringify(chat)
            websocket.send(jsonstr);
        }


        $("#chat-send").on("click", function () {
            let msg = $("#chat-input").val();
            websocketsend("TALK", roomId, username, msg);


            // 텍스트 입력란을 지울 수도 있습니다.
            $("#chat-input").val("");
        });


        //채팅창에서 나갔을 때
        function onClose(evt) {
            var str = username + ": 님이 방을 나가셨습니다.";

            websocketsend("LEAVE", roomId, username, str)
        }

        //채팅창에 들어왔을 때
        function onOpen(evt) {
            var str = username + ": 님이 입장하셨습니다.";

            websocketsend("ENTER", roomId, username, str)
        }

        function onMessage(data) {
            var msg = JSON.parse(data.data);
            console.log(roomId+"  "+msg.roomId);
            if(msg.roomId===roomId){
                let newMsg = ``;

                if(msg.type=="TALK"){
                    if(msg.sender===username){
                        newMsg = `<div class="d-flex flex-row justify-content-end mb-4">
                                                        <div class="chat-box text-end">
                                                            <div class="chat-author m-0 p-1">\${msg.sender}<p class="chat-time">\${msg.time}</p></div>
                                                            <div class="p-3 chat-message" style="border-radius: 15px; background-color: #288a54; color: white;">
                                                                <p class="small mb-0">\${msg.message}</p>
                                                            </div>
                                                        </div>
                                                    </div>`;
                    } else{
                        newMsg = `<div class="d-flex flex-row justify-content-start mb-4">
                                                        <div class="chat-box">
                                                            <div class="chat-author m-0 p-1">\${msg.sender}<p class="chat-time">\${msg.time}</p></div>
                                                            <div class="p-3 chat-message" style="border-radius: 15px; background-color: rgba(57, 192, 237,.2);">
                                                                <p class="small mb-0">\${msg.message}</p>
                                                            </div>
                                                        </div>
                                                    </div>`;
                    }

                } else {
                    newMsg = `<div class="d-flex flex-row justify-content-center mb-4"><div class="chat-box">\${msg.message}</div></div>`
                }

                $("#msgArea").append(newMsg);

            }
        }
    }

    let closeRoom = function(){
        $("#chatRoom").css("visibility", "hidden");
        $("#msgArea").html("");
    }
</script>
</html>
