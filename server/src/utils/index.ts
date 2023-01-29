import _ from 'lodash';

export const pagination = (list: Array<any>, page: number, limit: number =10) => {
  const pages = _.chunk(list, limit)
  return pages[page-1]
}  