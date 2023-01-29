import { z } from "zod";

export const registerBody = z.object({
  name: z.string(),
  email: z.string(),
  password: z.string()
});

export const loginBody = z.object({
  email: z.string(),
  password: z.string()
});