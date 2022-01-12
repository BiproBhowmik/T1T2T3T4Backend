import { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

import HashTag from 'App/Models/HashTag'

export default class HashTagsController {
  public async getHashTag (ctx: HttpContextContract) {
    
    const hashTag = '#'+ctx.request.all().query
    
    // console.log(hashTag);

    return HashTag.query().where('hastag', hashTag).first();
  }

  public async create ({}: HttpContextContract) {
  }

  public async store ({}: HttpContextContract) {
  }

  public async show ({}: HttpContextContract) {
  }

  public async edit ({}: HttpContextContract) {
  }

  public async update ({}: HttpContextContract) {
  }

  public async destroy ({}: HttpContextContract) {
  }
}
