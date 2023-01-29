import express from "express";
import "reflect-metadata";
import { useExpressServer } from "routing-controllers";
import { controllers } from "./controllers";

const bootstrap = async () => {
  const server = express();
  
  server.use(express.json());

  useExpressServer(server, {
    controllers: controllers,
  });

  return server.listen(3000, () => console.log(`Listening API on 3000!`));
};
bootstrap();
