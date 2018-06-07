
var loginForm = $('#myformtest').serializeArray();
var loginFormObject = {};
$.each(loginForm,
	function(i, v) {
		loginFormObject[v.name] = v.value;
	});



$(document).ready(function(){
	var data1={};

	$("#myformtest").serializeArray().map(function(x){data1[x.name] = x.value;});
	var data2=JSON.stringify(data1,null,"   ");
	console.log(data1);
	console.log(data2);
	$("#form-click").click(function(){
		$.ajax({
			data:data2,
			dataType: "json",
			contentType : "application/json",
			type: 'POST',
			url: '/admin/add',
			success: function(result){
				$messages.empty();
				$.each(result, function (i, user) { 	
					$messages.append('<li>id' + user.id  + '</li>');
				});

			}
		});
	});
});



$('#add-message').on('click',function (event) {
	event.preventDefault();
	$( "#table" ).empty();
	var $table = $('#table');
	var $messagesPatch= '';

	$.ajax({
		
		type: 'GET',
		url: '/admin/messages',
		success: function (data) {
			console.log('success', data);	
			$.each(data, function (i, message) {
				console.log(message.id);
				$messagesPatch=$messagesPatch + '<tr><td>' + message.id + ' </td><td>' + message.receiver + ' </td><td> ' + message.sender + '</td><td>' + message.text + '</td></tr>'  ;
			});

			$messagesPatch =$messagesPatch + '</tbody></table>';

			$table.append('<h2>Messages</h2><br><table id="example" class="table table-striped display" style="width:100%"><thead><tr><th>id</th><th>receiver</th><th>sender</th><th>text</th></tr></thead><tfoot><tr><th>id</th><th>receiver</th><th>sender</th><th>text</th></tr></tfoot><tbody>'+$messagesPatch);

			$(document).ready(function() {
				$('#example').DataTable();
			} );
		},
		error: function (error,response) {
			alert("There was an error with the connection");
			console.log(error);
			console.log(response);
            //alert(error);
        }
    });
});




var $modalform='  <button type="button" class="btn btn-success btn-sm data1" data-toggle="modal" data-target="#myModal">Update</button>\
  <div class="modal fade" id="myModal" role="dialog">\
    <div class="modal-dialog">\
      <div class="modal-content">\
        <div class="modal-header">\
        <h4 class="modal-title" style="float:left;">Update data</h4>\
          <button type="button" class="close" data-dismiss="modal">&times;</button>\
        </div>\
        <div class="modal-body">\
          <form action="#" id="formupdateuser">\
          <input type="hidden" class="formnameinput1" name="id" value="3487">\
          First name:<br>\
          <input type="text" class="formnameinput2 form-control" name="firstName" value="Mickey">\
          <br>\
          Last name:<br>\
          <input type="text" class="formnameinput3 form-control" name="lastName" value="Mouse">\
          <br>\
          Username:<br>\
          <input type="text" class="formnameinput4 form-control" name="username" value="Mouse">\
          <br>\
          Email:<br>\
          <input type="text" class="formnameinput5 form-control" name="email" value="Mouse">\
          <br>\
          Role:<br>\
          <input type="text" class="formnameinput6 form-control" name="role" readonly="readonly" >\
          <br>\
          is admin:<br>\
          <select id="isadmin" name="isadmin">\
          <option value="false" class="optionno2">No</option>\
          <option value="true"  class="optionno1">Yes</option>\
          </select>\
          <br>\
          <input id="formupdatebutton" type="submit" value="Submit">\
          </form>\
        </div>\
        <div class="modal-footer">\
          <button type="button" class="closemodal btn btn-default" data-dismiss="modal">Close</button>\
        </div>\
      </div>\
    </div>';



var $deletebutton='<button type="button" class="btn btn-danger">Danger</button>';


$('#add-users').on('click',function(event){
	event.preventDefault();
	$( "#table" ).empty();
	var $table = $('#table');
	var $usersPatch= '';
	$.ajax({		
		type: 'GET',
		url: '/admin/users',
		success: function (data) {
			console.log('success', data);		
			$.each(data, function (i, user) {
				$usersPatch=$usersPatch + 
				'<tr><td class="tid">' + user.id + ' </td>'+
				'<td class="tusername">' + user.username + ' </td>'+
				'<td class="tfirstname"> ' +user.firstName+ '</td>'+
				'<td class="tlastname">' + user.lastName + '</td>'+
				'<td class="temail">' + user.email + '</td>'+
				'<td class="trole">' + user.role + '</td>'+
				'<td class="tisadmin">' + user.isadmin + '</td>'+
				'<td>'+$modalform+ '</td>'+
				'<td> <button class="btn btn-danger" data-href="'+user.id+'" data-toggle="modal" data-target="#confirm-delete">delete</button></td></tr>' ;
			});
			
			$usersPatch =$usersPatch + '</tbody></table>';

			$table.hide().append('<h2>Users</h2><br><table id="example" class="display" style="width:100%">'+
				'<thead><tr><th>ID</th><th>Username</th>'+
				'<th>First Name</th><th>Last Name</th><th>email</th><th>Role</th><th>Admin</th><th>update</th><th>delete</th></tr></thead>'+
				'<tfoot><tr><th>ID</th><th>Username</th><th>First Name</th><th>Last Name</th><th>email</th><th>Role</th><th>Admin</th><th>update</th><th>delete</th>'+
				'</tr></tfoot><tbody>'+$usersPatch).fadeIn(2000);

			$(document).ready(function() {
				$('#example').DataTable();
			} );
		},
		error: function (error,response) {
			alert("There was an error with the connection");
			console.log(error);
			console.log(response);
            //alert(error);
        }
    });
});



//load modal form
// $("#koumpi").click(function(){
// var $content=''
//     $("#div22").load("http://127.0.0.1:8080/administrator/modal.html", function(responseTxt, statusTxt, xhr){
//         if(statusTxt == "success")
//             alert("External content loaded successfully!");
//         if(statusTxt == "error")
//             alert("Error: " + xhr.status + ": " + xhr.statusText);
//     });
// });






//delete button

$('#confirm-delete').on('show.bs.modal', function(e) {
	console.log($(this).parents('tr').prev());
    var $userid=$(e.relatedTarget).data('href'); //get data-href="54"  which is the id
    console.log($userid);

    $( ".btn-ok" ).click(function() {
   	$.ajax({	
   		type: 'DELETE',
   		url: '/admin/delete-user/'+$userid+'',
   		success: function (data) {
   			
   			$("#table").hide(function(){
					$('#add-users').click();
				});
   			console.log('success', data);
   			alert("USER DELETED")
   		},
   		error: function (error,response) {
   			alert("PROBLEM WITH DELETION OF USER")
   			console.log(error);
   			console.log(response);
			//alert(error);
		}
	});
   });
});


//fill in modal with data for update
$(document).on('click', '.data1', function(e) {

	var idTxt = $(this).closest('tr').find('.tid').text();
	var usernameTxt = $(this).closest('tr').find('.tusername').text();	
	var firstnameTxt = $(this).closest('tr').find('.tfirstname').text();
	var lastnameTxt = $(this).closest('tr').find('.tlastname').text();	
	var emailTxt = $(this).closest('tr').find('.temail').text();
    var roleTxt =  $(this).closest('tr').find('.trole').text();
    var isadminTxt =  $(this).closest('tr').find('.tisadmin').text();
      
    console.log(idTxt);
   
     console.log(firstnameTxt);
     console.log(lastnameTxt);
     console.log(usernameTxt);
     console.log(emailTxt);
     console.log(roleTxt);
     console.log(isadminTxt);
   	//assign values to form
    $(".formnameinput1").val( idTxt.trim() );
    $(".formnameinput2").val( firstnameTxt.trim() );
    $(".formnameinput3").val( lastnameTxt.trim() );
    $(".formnameinput4").val( usernameTxt.trim() );
    $(".formnameinput5").val( emailTxt.trim() );
    $(".formnameinput6").val( roleTxt.trim() );
    $(".formnameinput7").val( isadminTxt.trim() );
   
    if($.parseJSON(isadminTxt) === true){
    	$(".optionno1").attr('selected','selected');
    	console.log("hooray");
    }else{
    	$(".optionno2").attr('selected','selected');
    	console.log("baaad");
    }
   
  
	$("#formupdatebutton").click(function(e){
		e.preventDefault();
		var data1={};
		$("#formupdateuser").serializeArray().map(function(x){data1[x.name] = x.value;});
		console.log(data1);
		var data2=JSON.stringify(data1,null,"   ");
		console.log(data1);
		console.log(data2);

		 $('#myModal').modal('hide')


		$.ajax({
			data:data2,
			// dataType: "json",
			contentType : "application/json",
			type: 'POST',
			url: '/admin/update-user',
			success: function(result){
				$("#table").hide(function(){
					$('#add-users').click();
					$('.modal-backdrop').hide();
				});
				console.log("success");
				alert("success");

			},
			error: function (error,response) {
				 alert("COULD NOT UPDATE OF USER")
				
				console.log(error);
				console.log(response);
			//alert(error);
		}
	});
	});
});
   
    

$( document ).ready(function() {
    setInterval(function(){
    $.ajax({ 
    url: "/admin/allmessagesusers", 
    success: function(data){
    	$("#totalmessages").text(data.totalmessages);
    	$("#totalusers").text(data.totalusers);
    	
        console.log(data.totalmessages);
        console.log(data.totalusers);
      
   		 	}
		});
	}, 3000);
});
