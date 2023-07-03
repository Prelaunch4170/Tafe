"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const User_1 = __importDefault(require("App/Models/User"));
class AuthController {
    async login({ request, auth }) {
        const email = request.input('email');
        const password = request.input('password');
        const token = await auth.use('api').attempt(email, password, {
            expiresIn: '5 days',
        });
        return token.toJSON();
    }
    async register({ request, auth }) {
        const email = request.input('email');
        const password = request.input('password');
        const newUser = new User_1.default();
        newUser.email = email;
        newUser.password = password;
        await newUser.save();
        const token = await auth.use('api').login(newUser, {
            expiresIn: '5 days',
        });
        return token.toJSON();
    }
}
exports.default = AuthController;
//# sourceMappingURL=AuthController.js.map