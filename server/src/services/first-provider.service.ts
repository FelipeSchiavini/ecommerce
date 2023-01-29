import axios from "axios";
import { Service } from "typedi";
import { FirstProviderProduct, IProviderService, Product, ProviderName } from "./provider.service.model";

@Service()
export class FirstProviderService implements IProviderService {
  private firstProviderApi = axios.create({
    baseURL: process.env.FIRST_PROVIDER_URL,
    timeout: 2500,
  });

  async getAll() : Promise<Product[]>{
    const { data } = await this.firstProviderApi.get<never, {data: FirstProviderProduct[]}>('/')
    return mapFirstProviderDataToProduct(data)
  }

  async getById(id: string): Promise<Product>{
    const { data } = await this.firstProviderApi.get<never, {data: FirstProviderProduct}>(`/${id}`)
    return {
      id: data.id,
      name: data.nome,
      hasDiscount: false,
      descountValue: "0.00",
      price: data.preco,
      material: data.material,
      description: data.descricao,
      images: [data.imagem],
      provider: {
        name: ProviderName.First
      }
    }
  }
}

const mapFirstProviderDataToProduct = (productList: FirstProviderProduct[] ): Product[] => {
  return productList.map((product) => {
    return {
      id: product.id,
      name: product.nome,
      hasDiscount: false,
      descountValue: "0.00",
      price: product.preco,
      material: product.material,
      description: product.descricao,
      images: [product.imagem],
      provider: {
        name: ProviderName.First
      }
    }
  })
  
}