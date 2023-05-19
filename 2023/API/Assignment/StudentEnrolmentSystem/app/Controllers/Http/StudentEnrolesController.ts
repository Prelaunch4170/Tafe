import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import StudentEnroled from 'App/Models/StudentEnroled'
import StudentValidator from 'App/Validators/StudentValidator'

export default class StudentEnrolesController {
    //GET
    public async index({response}: HttpContextContract){
        const student = await StudentEnroled.all()
        if (!student){
            return response.notFound({message: 'Student not found'})
        }else{
            return student
        }
        }
    public async show({params,response}: HttpContextContract){
        
        const student = await StudentEnroled.find(params.id)
        if (!student){
            return response.notFound({message: 'Student not found'})
        }else{
            return response.ok(student)
        }
    }
    //POST
    public async store({ request, response }: HttpContextContract) {
        try {
            const payload = await request.validate(StudentValidator)
            const student: StudentEnroled = await StudentEnroled.create(payload)
            const stdentExists = await StudentEnroled.find(request.id)
            if (stdentExists){
                return response.notAcceptable({message: 'Student already exists'})
            }else{
                return response.ok(student)
            }
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
        
        const id = params.id

        const student = await StudentEnroled.find(id)
    
        if(!student){
            return response.notFound({message: 'Student not found'})
        }
        if (request.method()=== 'PATCH'){
            const payload = request.all();
      
            if (payload.given_name !== undefined) {
              student.given_name = payload.given_name;
            }
        
            if (payload.last_Name !== undefined) {
              student.last_name = payload.last_Name;
            }
        
            if (payload.email_address !== undefined) {
              student.email_address = payload.email_address;
            }
            await student.save();
            return response.ok(student.toJSON());
        }else if (request.method()=== 'PUT'){
            const payload = await request.validate(StudentValidator)
            student.given_name = payload.given_name
            student.last_name = payload.last_name
            student.email_address = payload.email_address
            
            await student.save()
            return response.ok(student);
        }
    }


}

