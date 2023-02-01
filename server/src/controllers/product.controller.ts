import _ from "lodash";
import { Body, Controller, Get, Param, QueryParam, UseBefore } from "routing-controllers";
import Container from 'typedi';
import { authorize } from "../middleware/auth.middleware";
import { FirstProviderService } from '../services/first-provider.service';
import { IProviderService, ProviderName } from "../services/provider.service.model";
import { pagination } from "../utils";
import { SecondProviderService } from "../services/second-provider.service";


// todo: create a mapping like
const providers: Record<ProviderName, new () => IProviderService> = {
  [ProviderName.First]: FirstProviderService,
  [ProviderName.Second]: SecondProviderService,
}

@Controller()
export class ProductController {
  @Get("/products")
  @UseBefore(authorize())
  async getAllProducts(@QueryParam("page") page: number): Promise<any> {

    // todo: 2 times FirstProviderService
    // todo: use Promise.all so it runs in parallel. you can use the mapping above like await Promise.all(Object.values(providers).map(provider => Container.get(provider).getAll()));

    const firstProviderData = await Container.get(FirstProviderService).getAll()
    const secondProviderData = await Container.get(FirstProviderService).getAll()
    // todo: note that pagination in memory is not scalable
    return pagination(_.concat(firstProviderData, secondProviderData), page)
  }

  @Get('/products/:productId')
  @UseBefore(authorize())
  async getOne(@Param("productId") productId: string, @Body() data : string) {
    // todo: define a class so routing-controllers can convert the body automatically
    // todo: it is not clear why we need a provider
    const { name } = JSON.parse(data) as {name: ProviderName}
    // todo: use the mapping like await Container.get(providers[name]).getById(productId)
    if(name == ProviderName.First) {
      return await Container.get(FirstProviderService).getById(productId)
    }
    if(name == ProviderName.Second) {
      return await Container.get(FirstProviderService).getById(productId)
    }
    return data
  }
}

