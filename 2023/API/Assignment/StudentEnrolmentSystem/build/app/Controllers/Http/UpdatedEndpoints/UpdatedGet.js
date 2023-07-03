async;
index({ response }, HttpContextContract);
{
    const student = await StudentEnroled.all();
    if (!student) {
        return response.notFound({ message: 'Student not found' });
    }
    else {
        return student;
    }
}
async;
show({ params, response }, HttpContextContract);
{
    const student = await StudentEnroled.find(params.id);
    if (!student) {
        return response.notFound({ message: 'Student not found' });
    }
    else {
        return response.ok(student);
    }
}
//# sourceMappingURL=UpdatedGet.js.map