function main()
{
	console.log("CORS test");
	$.ajax({
		url: 'http://127.0.0.1:3333/v1/Student/17',
		method: 'PATCH',
		data:JSON.stringify([{
			given_name: 'Samson',
		}]),
		success: function(data){
			console.log(data);
		}
	})
}