// import 'package:adhara_socket_io/adhara_socket_io.dart';

// class SocketSetup {
//   Future<void> socketConfig() async {
//     SocketIOManager manager = SocketIOManager();
//     SocketOptions socketOptions = SocketOptions("http://127.0.0.1:5400/");
//     SocketIO socket = await manager.createInstance(socketOptions);

//     socket.onConnect((data) {
//       print("connected...");
//       print(data);
//       socket.emit("message", ["Hello world!"]);
//     });
//     socket.on("product", (data) {
//       //sample event
//       print("news");
//       print(data);
//     });
//     socket.connect();

//     ///disconnect using
//     ///manager.
//   }
// }
