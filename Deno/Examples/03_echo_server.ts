// deno run --allow-net ./03_echo_server.ts
//
// $ nc localhost 8080 // -- yay -S gnu-netcat
// hello world
// hello world

const hostname = "0.0.0.0";
const port = 8080;
const listener = Deno.listen({ hostname, port });

console.log(`Listening on ${hostname}:${port}`);

for await (const conn of listener) {
  Deno.copy(conn, conn);
}
