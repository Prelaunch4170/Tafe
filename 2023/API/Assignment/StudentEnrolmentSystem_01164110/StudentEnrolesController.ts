import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import StudentEnroled from 'App/Models/StudentEnroled'
import StudentValidator from 'App/Validators/StudentValidator'

export default class StudentEnrolesController {
    //GET
    public async index({}: HttpContextContract){
        const student = await StudentEnroled.all()
        return student
        }
    public async show({params,response}: HttpContextContract){
        const student = await StudentEnroled.find(params.id)
        return response.ok(student)
    }
    //POST
    public async store({ request, response }: HttpContextContract) {
        try {
            const payload = await request.validate(StudentValidator)
            const Student: StudentEnroled = await StudentEnroled.create(payload)
            return response.ok(Student)
        } catch (error) {
            response.badRequest(error.messages)
        }
    }
    //Delete
    public async destroy({params, response}: HttpContextContract){
        const id = params.id 
        const student = await StudentEnroled.find(id)

        if(!student){
            return response.notFound({message: 'Student not found'})
        }
        await student.delete()

        return response.ok({message: `Student ${id + ':' + "'" + student.given_name +"'"} was deleted successfully`})
    }
    //PUT
    public async update({request, response, params}: HttpContextContract){
        const payload = await request.validate(StudentValidator)
        const id = params.id

        const student = await StudentEnroled.find(id)
        if(!student){
            return response.notFound({message: 'Student not found'})
        }

        student.given_name = payload.given_name
        student.last_name = payload.last_name
        student.email_address = payload.email_address
        
        await student.save()
        return response.ok(student)
    }

}

