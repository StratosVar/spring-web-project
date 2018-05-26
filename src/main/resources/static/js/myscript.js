//$(document).ready(function() {
//    $.ajax({
//        url: "http://rest-service.guides.spring.io/greeting"
//    }).then(function(data) {
//       $('.greeting-id').append(data.id);
//       $('.greeting-content').append(data.content);
//    });
//});



$(function () {
	var $messages = $('#messages');
	$.ajax({
		type: 'GET',
		url: 'http://127.0.0.1:8080/foos',
		success: function (data) {
			console.log('success', data);
			$.each(data, function (i, message) {
				$messages.append('<li>id' + message.id + ' ,text:' + message.text + ' user: ' + message.sender.username + '</li>');
			});

		},
		error: function () {
			alert('error loading messages');
		}
	});
});




$(function () {
	var $text = $('#text_update');
	var $id = $('#id');
	$.ajax({
		type: 'GET',
		url: 'http://127.0.0.1:8080/foos1?id=1',
		success: function (data) {
			console.log('success', data);
			
			console.log(data.text);
			console.log(data.id);
			$text.attr('value', data.text)
			$id.val(data.id);


		},
		error: function () {
			alert('error loading messages');
		}
	});
});

$(document).ready(function(){
    $(".button").click(function(event){
        event.preventDefault();
    });
});




// $('#add-message').on('click',function(){
// 	var message ={
// 			text:$text.val(),
// 	};

// 	$.ajax({
// 		type: 'POST',
// 		url: 'http://127.0.0.1:8080/foos',
// 		data: message,
// 		success: function(newMessage){
// 			$messages.append('<li>text:' + message.text+ '</li>');
// 		},
// 		error: function(){
// 			alert('provlima me post')
// 		}

// 	});
// });


