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
        const stdentExists = await StudentEnroled.find(request.input('student_id'))
        const payload = await request.validate(StudentValidator)
        if (stdentExists){
            return response.json({message: 'Student already exists'})
        }else{
            const student: StudentEnroled = await StudentEnroled.create(payload)
            return response.ok(student)
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
        
            if (payload.last_name !== undefined) {
              student.last_name = payload.last_name;
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
            
            if (payload.given_name !== undefined) {
                student.given_name = payload.given_name;
              }else{
                return response.json({message: 'Enter Given Name'})
              }
          
              if (payload.last_name !== undefined) {
                student.last_name = payload.last_name;
              }else{
                return response.json({message: 'Enter Last Name'})
              }
          
              if (payload.email_address !== undefined) {
                student.email_address = payload.email_address;
              }else{
                return response.json({message: 'Enter Email'})
              }
            await student.save()
            return response.ok(student);
        }
    }


}

