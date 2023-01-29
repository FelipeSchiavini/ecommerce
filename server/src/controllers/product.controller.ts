import _ from "lodash";
import { Body, Controller, Get, Param, QueryParam, UseBefore } from "routing-controllers";
import Container from 'typedi';
import { authorize } from "../middleware/auth.middleware";
import { FirstProviderService } from '../services/first-provider.service';
import { ProviderName } from "../services/provider.service.model";
import { pagination } from "../utils";


@Controller()
export class ProductController {
  @Get("/products")
  @UseBefore(authorize())
  async getAllProducts(@QueryParam("page") page: number): Promise<any> {

    const firstProviderData = await Container.get(FirstProviderService).getAll()
    //const secondProviderData = await Container.get(FirstProviderService).getAll()
    return pagination(_.concat(firstProviderData), page)
  }

  @Get('/products/:productId')
  async getOne(@Param("productId") productId: string, @Body() data : string) {
    const { name } = JSON.parse(data) as {name: ProviderName}
    if(name == ProviderName.First) {
      return await Container.get(FirstProviderService).getById(productId)
    }
    if(name == ProviderName.Second) {
      return await Container.get(FirstProviderService).getById(productId)
    }
    return data
  }
}

