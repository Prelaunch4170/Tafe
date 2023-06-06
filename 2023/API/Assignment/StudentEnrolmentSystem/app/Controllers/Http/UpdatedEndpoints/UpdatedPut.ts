if (request.method()=== 'PUT'){
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
