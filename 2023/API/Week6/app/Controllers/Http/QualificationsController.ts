import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import Qualification from 'App/Models/Qualification'
import { schema, rules } from '@ioc:Adonis/Core/Validator'
export default class QualificationsController {
  public async index({}: HttpContextContract) {
    //return{hello: 'Andre says hello'}
    const quals = await Qualification.all();
    return quals;
  }

  public async store({request, response}: HttpContextContract) {
    const newQualSchema = schema.create({
      QualCode: schema.string({}, [rules.maxLength(32)]),
      NationalQualCode: schema.string({}, [rules.maxLength(32)]),
      TafeQualCode: schema.string({}, [rules.maxLength(32)]),
      QualName: schema.string({}, [rules.maxLength(32)]),
      TotalUnits: schema.number(),
      CoreUnits: schema.number(),
      ElectedUnits: schema.number(),
      ReqListedElectedUnits: schema.number(),
     })
     try {
      const payload = await request.validate({
        schema: newQualSchema
      })
      const qual: Qualification = await Qualification.create(payload)
      return response.ok(qual)
     }catch(error){
      response.badRequest(error.messages)
     }
     
     
  }

  public async show({params, response}: HttpContextContract) {
    const qual = await Qualification.find(params.id)

    return response.ok(qual)
  }

  public async update({}: HttpContextContract) {}

  public async destroy({params, response}: HttpContextContract) {
    const id = params.id
    const qual = await Qualification.find(id)

    if(!qual){
      return response.notFound({message: 'qualification not found'})
    }
    await qual.delete()
    return response.ok({
      message: `qualification ${id + ':' + qual.QualName} was deleted`,
    })
  }
}
