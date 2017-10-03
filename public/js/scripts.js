$(function() {
  $("#register-form").validate({
        rules: {
          first_name: {required: true},
          last_name: {required: true},
          password: {
            required: true,
            minlength: 8
          },
          password_confirm:{
            required: true,
            minlength: 8,
            equalTo: "#password"
          },
          email: {
            required: true,
            email:true
            },
          email_confirm:{
            required: true,
            email:true,
            equalTo: "#email"

          }
        },
        //For custom messages
        messages: {
            first_name: {
              required: "First name required"
            },
            last_name: {
              required: "Last name required"
            },
            password:{
                required: "Enter a password",
                minlength: "Enter at least 8 characters"
            },
            password_confirm:{
              required: "Enter a password",
              minlength: "Enter at least 8 characters",
              equalTo: "Passwords don't match"
            },
            email:{
              required: "Please enter your email address",
              email: "Please enter a valid email."
            },
            email_confirm:{
              required: "Please re-enter your email address",
              email: "Please enter a valid email address",
              equalTo: "Emails don't match"
            }
        },
      errorElement : 'div',
        errorPlacement: function(error, element) {
          var placement = $(element).data('error');
          if (placement) {
            $(placement).append(error)
          } else {
            error.insertAfter(element);
          }
        }

     });
});



// validations by: https://jqueryvalidation.org/documentation/
