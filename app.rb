require 'socket'

# reference: https://practicingruby.com/articles/implementing-an-http-file-server

port = 8000
server = TCPServer.new port
printf "Starting server on port %d\n", port

loop do
    socket = server.accept
    req = socket.gets

    # log responses
    STDOUT.puts req

    resp = "Hello world!"
    socket.print "HTTP/1.1 200 OK\r\n" +
                 "Content-Type: text/plain\r\n" +
                 "Content-Length: #{resp.bytesize}\r\n" +
                 "Connection: close\r\n" +
                 "\r\n"
    socket.print resp
    socket.close
end
    
