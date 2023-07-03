async;
store({ request, response }, HttpContextContract);
{
    const stdentExists = await StudentEnroled.find(request.input('student_id'));
    const payload = await request.validate(StudentValidator);
    if (stdentExists) {
        return response.json({ message: 'Student already exists' });
    }
    else {
        const student = await StudentEnroled.create(payload);
        return response.ok(student);
    }
}
//# sourceMappingURL=UpdatedPost.js.map