import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import StudentEnroled from 'App/Models/StudentEnroled'

export default class StudentEnrolesController {
    public async show({params,response}: HttpContextContract){
        const student = await StudentEnroled.find(params.id)
        return response.ok(student)
    }

}
