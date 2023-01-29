import jwt from 'jsonwebtoken';

interface Headers {
  'auth-token'?: string;
}

export const authorize = (): ((_request: Request, response: Response, next: (err?: Error) => void) => void) => {
  return (request: Request, response: Response, next: (err?: Error) => void) => {
    const headers = request.headers as Headers
    if(!headers?.['auth-token']){
      return {
        message: "Route Authenticad"
      }
    }
    try {
      jwt.verify(headers['auth-token'], process.env.TOKEN_SECRET as string)
      next()
    } catch(error){
      console.log("🚀 ERROR: invalid token! authorize 17", error)
      return {
        message: "Token invalid!"
      }
    }    
  };
};