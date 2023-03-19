import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

export default class QualificationsController {
  public async index({}: HttpContextContract) {
    return{hello: 'Andre says hello'}
  }

  public async store({}: HttpContextContract) {}

  public async show({}: HttpContextContract) {}

  public async update({}: HttpContextContract) {}

  public async destroy({}: HttpContextContract) {}
}
