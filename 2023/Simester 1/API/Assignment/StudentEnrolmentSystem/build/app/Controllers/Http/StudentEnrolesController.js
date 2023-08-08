"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const StudentEnroled_1 = __importDefault(require("App/Models/StudentEnroled"));
const StudentValidator_1 = __importDefault(require("App/Validators/StudentValidator"));
class StudentEnrolesController {
    async index({ response }) {
        const student = await StudentEnroled_1.default.all();
        if (student == undefined) {
            return response.notFound({ message: 'Students not found' });
        }
        else {
            return student;
        }
    }
    async show({ params, response }) {
        const student = await StudentEnroled_1.default.find(params.id);
        if (!student) {
            return response.notFound({ message: 'Student not found' });
        }
        else {
            return response.ok(student);
        }
    }
    async store({ request, response }) {
        const stdentExists = await StudentEnroled_1.default.find(request.input('student_id'));
        const payload = await request.validate(StudentValidator_1.default);
        if (stdentExists) {
            return response.json({ message: 'Student already exists' });
        }
        else {
            const student = await StudentEnroled_1.default.create(payload);
            return response.ok(student);
        }
    }
    async destroy({ params, response }) {
        const id = params.id;
        const student = await StudentEnroled_1.default.find(id);
        if (!student) {
            return response.notFound({ message: 'Student not found' });
        }
        await student.delete();
        return response.ok({ message: `Student ${id + ':' + "'" + student.given_name + "'"} was deleted successfully` });
    }
    async update({ request, response, params }) {
        const id = params.id;
        const student = await StudentEnroled_1.default.find(id);
        if (!student) {
            return response.notFound({ message: 'Student not found' });
        }
        if (request.method() === 'PATCH') {
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
        }
        else if (request.method() === 'PUT') {
            const payload = await request.validate(StudentValidator_1.default);
            student.given_name = payload.given_name;
            student.last_name = payload.last_name;
            student.email_address = payload.email_address;
            if (payload.given_name !== undefined) {
                student.given_name = payload.given_name;
            }
            else {
                return response.json({ message: 'Enter Given Name' });
            }
            if (payload.last_name !== undefined) {
                student.last_name = payload.last_name;
            }
            else {
                return response.json({ message: 'Enter Last Name' });
            }
            if (payload.email_address !== undefined) {
                student.email_address = payload.email_address;
            }
            else {
                return response.json({ message: 'Enter Email' });
            }
            await student.save();
            return response.ok(student);
        }
    }
}
exports.default = StudentEnrolesController;
//# sourceMappingURL=StudentEnrolesController.js.map