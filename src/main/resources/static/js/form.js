function email_validate(email)
{
var regMail = /^([_a-zA-Z0-9-]+)(\.[_a-zA-Z0-9-]+)*@([a-zA-Z0-9-]+\.)+([a-zA-Z]{2,3})$/;

    if(regMail.test(email) == false)
    {
    document.getElementById("status").innerHTML    = "<span class='warning'>Email  is not valid .</span>";
    }
    else
    {
    document.getElementById("status").innerHTML = "<span class='valid'>Valid Email</span>"; 
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

function validatephone(phone) 
{
    var maintainplus = '';
    var numval = phone.value
    if ( numval.charAt(0)=='+' )
    {
        var maintainplus = '';
    }
    curphonevar = numval.replace(/[\\A-Za-z!"£$%^&\,*+_={};:'@#~,.Š\/<>?|`¬\]\[]/g,'');
    phone.value = maintainplus + curphonevar;
    var maintainplus = '';
    phone.focus;
}

function Validate(txt) {
    txt.value = txt.value.replace(/[^a-zA-Z-'\n\r.]+/g, '');
}

