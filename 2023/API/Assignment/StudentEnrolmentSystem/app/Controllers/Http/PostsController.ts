import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'
import StudentEnroled from 'App/Models/StudentEnroled'
import { schema, rules } from "@ioc:Adonis/Core/Validator"

export default class PostsController {
    public async store({ request, response }: HttpContextContract) {
        console.log(request.all())
        const newStudent = schema.create({
            given_name: schema.string({}, [rules.maxLength(64)]),
            last_Name: schema.string({}, [rules.maxLength(64)]),
            email_address: schema.string({}, [rules.maxLength(64)])
        })
        try {
            const payload = await request.validate({
                schema: newStudent
            })

            const Student: StudentEnroled = await StudentEnroled.create(payload)
            return response.ok(Student)
        } catch (error) {
            response.badRequest(error.messages)
        }
    }
}