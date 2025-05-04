import { WebSocketServer } from "ws";

const server = new WebSocketServer({ port: 3001 });

server.on("connection", (socket) => {
  socket.send("Hello WebSocket!");
  //   socket.on("message", (message) => {
  //     console.log("received: %s", message);
  //   });
});
