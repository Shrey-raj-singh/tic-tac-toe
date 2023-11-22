const express = require('express');
const http = require('http');
const mongoose = require('mongoose');
const socketIO = require('socket.io');
const app = express();
const port =process.env.PORT || 3000;
const Room = require('./models/room')
var server = http.createServer(app);

const io = socketIO(server);

// middleware
app.use(express.json);


const DB = "mongodb+srv://shrey23:shrey123@cluster0.b8pvx0f.mongodb.net/?retryWrites=true&w=majority";
io.on('connection', (socket) => {
    console.log('A user connected');
    // Handle disconnect event
    socket.on('createRoom', async ({nickname}) => {
        console.log(nickname);
        //room is created
        try {
            let room = new Room();
            let player = {
                socketID: socket.id,
                nickname,
                playerType: 'X',
            };
            room.players.push(player);
            room.turn = player;
            await room.save();
            console.log(room);
            const roomID = room._id.toString();
    
            socket.join(roomID);

            io.to(roomID).emit("createRoomSuccess", room);
        } catch (e) {
            console.log(e);
        }
    });
});

mongoose.connect(DB).then(()=>{
    console.log("connected");
}).catch((e)=>{
    console.log(e);
});


server.listen(port, "0.0.0.0", ()=>{
    console.log(`Server started and running on port  ${port}`);
})