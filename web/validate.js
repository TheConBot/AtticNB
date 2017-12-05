function validatePassword(){
    var pass1 = document.getElementById("password1").value;
    var pass2 = document.getElementById("password2").value;
    if(pass1 !== pass2){
        alert("Passwords do not match.");
    }
}

function validateEmail(){
    var e1 = document.getElementById("email1").value;
    var e2 = document.getElementById("email2").value;
    if(e1 !== e2){
        alert("Emails do not match.");
    }
}