import type { HttpContextContract } from '@ioc:Adonis/Core/HttpContext'

import { HttpContext } from "@adonisjs/core/build/standalone";

export default class AuthController {
    public async login({ request, auth}: HttpContextContract){
        const email = request.input('email')
        const password = request.input('password')
        const token = await auth.use('api').attempt(email, password,{
            expiresIn: '5 days',
        })
        return token.toJSON()
    }
}
