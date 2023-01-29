
export interface IProviderService {
  getAll : () => Promise<Product[]>
  getById: (id: string) => Promise<Product>;
}

export enum ProviderName{
  First = 'fist_provider',
  Second = 'second_provider'
}

export interface Product {
  id: string;
  hasDiscount: boolean;
  descountValue: string;
  price: string;
  name: string;
  material: string;
  description: string;
  images: Array<string>;
  provider: {
    name: ProviderName;
  }
}

export interface FirstProviderProduct {
  nome: string;
  descricao: string;
  categoria: string;
  imagem: string;
  preco: string;
  material: string;
  departamento: string;
  id: string;
}

export interface SecondProviderProduct {
  id : string;
  hasDiscount : boolean;
  discountValue: string;
  name: string;
  description: string;
  gallery: Array<string>;
  price: string;
  details: {
    adjective : string;
    material : string;
  }
}