import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import StudentEnroled from 'App/Models/StudentEnroled'
export default class PatchesController {
    public async update({request, response, params}: HttpContextContract){
        const id = params.id;
        const student = await StudentEnroled.find(id);
      
        if (!student) {
          return response.notFound({ message: 'Student not found' });
        }
      
        if (!request.hasBody()) {
            return response.notFound({ message: 'please enter body' });
        }else{
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
        }
      
        return response.ok(student.toJSON());
    }
    
}
