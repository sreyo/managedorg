<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>

  <!-- Load the required client component. -->
  
  <script src="https://js.braintreegateway.com/web/3.65.0/js/client.min.js"></script>
  <script src="https://js.braintreegateway.com/web/3.65.0/js/hosted-fields.min.js"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/css/bootstrapValidator.min.css"/>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.2/js/bootstrapValidator.min.js"></script>
  <style type="text/css">
  body {
  background-color: #fff;
  padding: 15px;
}

.toast {
  position: fixed;
  top: 15px;
  right: 15px;
  z-index: 9999;
}

.bootstrap-basic {
  background: white;
}
	3
/* Braintree Hosted Fields styling classes*/
.braintree-hosted-fields-focused {
  color: #495057;
  background-color: #fff;
  border-color: #80bdff;
  outline: 0;
  box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
}

.braintree-hosted-fields-focused.is-invalid {
  border-color: #dc3545;
  box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
}
  
  </style>
  <script type="text/javascript">
  $( document ).ready(function() {

  var form =     $('form[name="payment_form"]')

alert("1323"+form);
  braintree.client.create({
    authorization: 'sandbox_g42y39zw_348pk9cgf3bgyw2b'
  }, function(err, clientInstance) {
    if (err) {
      console.error(err);
      return;
    }

    braintree.hostedFields.create({
      client: clientInstance,
      styles: {
        input: {
          // change input styles to match
          // bootstrap styles
          'font-size': '1rem',
          color: '#495057'
        }
      },
      fields: {
        cardholderName: {
          selector: '#cc-name'
        },
        number: {
          selector: '#cc-number',
          placeholder: '4111 1111 1111 1111'
        },
        cvv: {
          selector: '#cc-cvv',
          placeholder: '123'
        },
        expirationDate: {
          selector: '#cc-expiration',
          placeholder: 'MM / YY'
        }
      }
    }, function(err, hostedFieldsInstance) {
      if (err) {
        console.error(err);
        return;
      }
      function createInputChangeEventListener(element) {
        return function () {
          validateInput(element);
        }
      }

      function setValidityClasses(element, validity) {
        if (validity) {
          element.removeClass('is-invalid');
          element.addClass('is-valid');  
        } else {
          element.addClass('is-invalid');
          element.removeClass('is-valid');  
        }    
      }
      
      function validateInput(element) {
        // very basic validation, if the
        // fields are empty, mark them
        // as invalid, if not, mark them
        // as valid

        if (!element.val().trim()) {
          setValidityClasses(element, false);

          return false;
        }

        setValidityClasses(element, true);

        return true;
      }
      
      function validateEmail () {
        var baseValidity = validateInput(email);
        
        if (!baseValidity) {  
          return false;
        }

        if (email.val().indexOf('@') === -1) {
          setValidityClasses(email, false);
          return false;
        }
        
        setValidityClasses(email, true);
        return true;
      }

      var ccName = $('#cc-name');
      var email = $('#email');

      ccName.on('change', function () {
        validateInput(ccName);
      });
      email.on('change', validateEmail);


              hostedFieldsInstance.on('validityChange', function(event) {
        var field = event.fields[event.emittedBy];

        // Remove any previously applied error or warning classes
        $(field.container).removeClass('is-valid');
        $(field.container).removeClass('is-invalid');

        if (field.isValid) {
          $(field.container).addClass('is-valid');
        } else if (field.isPotentiallyValid) {
          // skip adding classes if the field is
          // not valid, but is potentially valid
        } else {
          $(field.container).addClass('is-invalid');
        }
      });

      hostedFieldsInstance.on('cardTypeChange', function(event) {
        var cardBrand = $('#card-brand');
        var cvvLabel = $('[for="cc-cvv"]');

        if (event.cards.length === 1) {
          var card = event.cards[0];

          // change pay button to specify the type of card
          // being used
          cardBrand.text(card.niceType);
          // update the security code label
          cvvLabel.text(card.code.name);
        } else {
          // reset to defaults
          cardBrand.text('Card');
          cvvLabel.text('CVV');
        }
      });

      form.submit(function(event) {
        event.preventDefault();

        var formIsInvalid = false;
        var state = hostedFieldsInstance.getState();

        // perform validations on the non-Hosted Fields
        // inputs
        if (!validateEmail()) {
          formIsInvalid = true;
        }

        // Loop through the Hosted Fields and check
        // for validity, apply the is-invalid class
        // to the field container if invalid
        Object.keys(state.fields).forEach(function(field) {
          if (!state.fields[field].isValid) {
            $(state.fields[field].container).addClass('is-invalid');
            formIsInvalid = true;
          }
        });

        if (formIsInvalid) {
          // skip tokenization request if any fields are invalid
          return;
        }

        hostedFieldsInstance.tokenize(function(err, payload) {
          if (err) {
            console.error(err);
            return;
          }

          // This is where you would submit payload.nonce to your server
        //  $('.toast').toast('show');

          // you can either send the form values with the payment
          // method nonce via an ajax request to your server,
          // or add the payment method nonce to a hidden inpiut
          // on your form and submit the form programatically
          alert( $('#payment-method-nonce').val(payload.nonce));
           var submit = $('input[type="submit"]');alert(submit);
        });
      });
    });
  });});
  </script>
  </head>
<body>
<!-- Bootstrap inspired Braintree Hosted Fields example -->
<div class="bootstrap-basic">
  <form id="payment_form" name="payment_form"class="needs-validation" novalidate="">

    <div class="row">
      <div class="col-sm-6 mb-3">
        <label for="cc-name">Name on card</label>
        <div class="form-control" id="cc-name"></div>
        <small class="text-muted">Full name as displayed on card</small>
        <div class="invalid-feedback">
          Name on card is required
        </div>
      </div>
      <div class="col-sm-6 mb-3">
        <label for="email">Email</label>
        <input type="email" class="form-control" id="email" placeholder="you@example.com">
        <div class="invalid-feedback">
          Please enter a valid email address for shipping updates.
        </div>
      </div>
    </div>

    <div class="row">
      <div class="col-sm-6 mb-3">
        <label for="cc-number">Credit card number</label>
        <div class="form-control" id="cc-number"></div>
        <div class="invalid-feedback">
          Credit card number is required
        </div>
      </div>
      <div class="col-sm-3 mb-3">
        <label for="cc-expiration">Expiration</label>
        <div class="form-control" id="cc-expiration"></div>
        <div class="invalid-feedback">
          Expiration date required
        </div>
      </div>
      <div class="col-sm-3 mb-3">
        <label for="cc-expiration">CVV</label>
        <div class="form-control" id="cc-cvv"></div>
        <div class="invalid-feedback">
          Security code required
        </div>
      </div>
    </div>

    <hr class="mb-4">
    <div class="text-center">
    <input type="text" id="payment-method-nonce" name="payment-method-nonce">
    <button class="btn btn-primary btn-lg" type="submit">Pay with <span id="card-brand">Card</span></button>
    </div>
  </form>
</div>
<div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-autohide="false">
  <div class="toast-header">
    <strong class="mr-auto">Success!</strong>
    <small>Just now</small>
    <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="toast-body">
    Next, submit the payment method nonce to your server.
  </div>
</div>
</div>
</body>
</html>