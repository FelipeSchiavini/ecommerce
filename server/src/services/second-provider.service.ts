import axios from "axios";
import { Service } from "typedi";
import { IProviderService, Product, ProviderName, SecondProviderProduct } from "./provider.service.model";

@Service()
export class SecondProviderService implements IProviderService {
  private secondProviderApi = axios.create({
    baseURL: process.env.SECOND_PROVIDER_URL,
    timeout: 2500,
  });

  async getAll() : Promise<Product[]>{
    const { data } = await this.secondProviderApi.get<never, {data: SecondProviderProduct[]}>('/')
    return mapSecondProviderDataToProduct(data)
  }

  async getById(id: string): Promise<Product>{
    const { data } = await this.secondProviderApi.get<never, {data: SecondProviderProduct}>(`/${id}`)
    return {
      id: data.id,
      name: data.name,
      hasDiscount: data.hasDiscount,
      descountValue: data.discountValue,
      price: data.price,
      material: data.details.material,
      description: data.description,
      images: data.gallery,
      provider: {
        name: ProviderName.Second
      }
    }
  }
}

const mapSecondProviderDataToProduct = (productList: SecondProviderProduct[]): Product[] => {
  return productList.map(product => {
    return {
      id: product.id,
      name: product.name,
      hasDiscount: product.hasDiscount,
      descountValue: product.discountValue,
      price: product.price,
      material: product.details.material,
      description: product.description,
      images: product.gallery,
      provider: {
        name: ProviderName.Second
      }
    }
  })
  
}