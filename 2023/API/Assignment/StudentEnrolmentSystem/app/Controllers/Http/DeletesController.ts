import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import StudentEnroled from 'App/Models/StudentEnroled'

export default class DeletesController {
    public async destroy({params, response}: HttpContextContract){
        const id = params.id 
        const student = await StudentEnroled.find(id)

        if(!student){
            return response.notFound({message: 'Student not found'})
        }
        await student.delete()

        return response.ok({message: `Student ${id + ':' + "'" + student.given_name +"'"} was deleted successfully`})
    }
}