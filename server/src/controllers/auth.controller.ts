import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { Body, Controller, Post, Res } from "routing-controllers";
import { createUser, findUserByEmail } from '../utils/user';
import { loginBody, registerBody } from './controllers.model';

type data = string;


@Controller()
export class AuthController {
  @Post("/register")
  async register(@Body() data: data) {
    
    const { name, email, password } = registerBody.parse(JSON.parse(data));

    const userFound = await findUserByEmail(email)

    if (userFound) {
      return {
        message: "Email already exist!"
      }
    }
    
    const user = await createUser({
      name,
      email,
      password
    })
    
    return user.id;
  }

  @Post("/login")
  async login(@Body() data: data, @Res() res : Response) {
    const { email, password } = loginBody.parse(JSON.parse(data));
    const user = await findUserByEmail(email)
    if(!user){
      return {
        status: 404,
        message: "Email was not found!"
      }
    }

    const isValidPassword = await bcrypt.compare(password, user.password)

    if(!isValidPassword) {
      return {
        status: 404,
        message: "Email or password does not found!"
      } 
    }

    const token = jwt.sign({id: user.id}, process.env.TOKEN_SECRET as string)
    return {
      access_token: token,
      token_type: 'Bearer',
    };


  }
}
