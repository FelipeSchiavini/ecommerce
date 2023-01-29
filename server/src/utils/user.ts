import { User } from "@prisma/client";
import bcrypt from 'bcryptjs';
import { prisma } from "../libs/prisma.client";

interface CreateUserInput {
  email: string;
  password: string;
  name: string;
}

export const findUserByEmail = async (email: string): Promise<User | null> => {
  return await prisma.user.findFirst({
    where: {
      email: email,
    },
  });
}

export const createUser = async(input: CreateUserInput): Promise<User> =>{

  var salt = bcrypt.genSaltSync(10);
  const hashedPassword = await bcrypt.hash(input.password, salt)

  return await prisma.user.create({
    data: {
      email: input.email,
      password: hashedPassword,
      name: input.name,
    },
  });
}

