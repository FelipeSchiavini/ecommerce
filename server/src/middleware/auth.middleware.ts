import jwt from 'jsonwebtoken';

interface Headers {
  'auth-token'?: string;
}

export const authorize = (): ((_request: Request, response: Response, next: (err?: Error) => void) => void) => {
  return (request: Request, response: Response, next: (err?: Error) => void) => {
    const headers = request.headers as Headers
    if(!headers?.['auth-token']){
      return {
        message: "Route Authenticated"
      }
    }
    try {
      const autorized = jwt.verify(headers['auth-token'], process.env.TOKEN_SECRET as string)
      console.log("🚀 ~ file: auth.middleware.ts:17 ~ return ~ autorized", autorized)
      next()
    } catch(e){
      console.log("🚀 ERROR: invalid token! autorized 17", e)
      return {
        message: "the Token is invalid!"
      }
    }    
  };
};