# server side socket.io 통신 cheatsheet

#### sender 한명에게(socket)어게 송신
```javascript
socket.emit('message', "this is a test");
```

#### sender를 포함한 모든 client들에게 송신
```javascript
io.emit('message', "this is a test");
```

#### sender를 제외한 모든 client들에게 송신
```javascript
socket.broadcast.emit('message', "this is a test");
```

#### sender를 제외한 game이라는 room의 모든 client들에게 송신
```javascript
socket.broadcast.to('game').emit('message', 'nice game');
```

#### sender를 포함한 game이라는 room의 모든 client들에게 송신
```javascript
io.in('game').emit('message', 'cool game');
```

#### sender에게 송신하되 game이라는 room에 존재한다면 송신
```javascript
socket.to('game').emit('message', 'enjoy the game');
```

#### myNamespace라는 namespace의 모든 client들에게 송신
```javascript
io.of('myNamespace').emit('message', 'gg');
```

#### socketId를 가진 client에게 송신
```javascript
socket.broadcast.to(socketId).emit('message', 'for your eyes only');
```

#### socketId리스트를 iterate
```javascript
Object.keys(io.sockets.sockets).forEach((socketId) => {});
```