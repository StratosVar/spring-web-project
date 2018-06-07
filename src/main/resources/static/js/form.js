function email_validate(email){
var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;

    if(regMail.test(email) == false)
    {
    document.getElementById("status").innerHTML = "Email is not valid";
    document.getElementById("status").style.color = "red";
    document.getElementById("status").style.fontSize = "small";
    }
    else
    {
    document.getElementById("status").innerHTML = "Valid email";	
    document.getElementById("status").style.color = "green";
    document.getElementById("status").style.fontSize = "small";
    }
}


function checkPassword()
{
    var password1 = document.getElementById('password1');
    var password2 = document.getElementById('password2');
    var message = document.getElementById('passwordConfirm');
    var greencolor = "#66cc66";
    var redcolor = "#ff6666";
    if(password1.value == password2.value){
        password2.style.backgroundColor = greencolor;
        password1.style.backgroundColor = greencolor;
        message.style.color = greencolor;
        message.innerHTML = "Passwords Match Hooray!"
    }else{
        password2.style.backgroundColor = redcolor;
        password1.style.backgroundColor = redcolor;
        message.style.color = redcolor;
        message.innerHTML = "Password Mismatch!"
    }
} 


function Validate(txt) {
    txt.value = txt.value.replace(/[^a-zA-Z-'\n\r.]+/g, '');
}




