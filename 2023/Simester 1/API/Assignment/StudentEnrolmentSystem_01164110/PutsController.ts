import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import StudentValidator from 'App/Validators/StudentValidator'
import StudentEnroled from 'App/Models/StudentEnroled'

export default class PutsController {
    public async update({request, response, params}: HttpContextContract){
        const payload = await request.validate(StudentValidator)
        const id = params.id

        const student = await StudentEnroled.find(id)
        if(!student){
            return response.notFound({message: 'Student not found'})
        }

        student.given_name = payload.given_name
        student.last_Name = payload.last_Name
        student.email_address = payload.email_address
        
        await student.save()
        return response.ok(student)
    }
}
