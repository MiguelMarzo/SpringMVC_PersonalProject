
$.validator.addMethod("loginFormat", function(value, element) {
	return this.optional(element) || /^[A-Za-z0-9]+$/.test(value);
}, "Must contain only chars and numbers");

var validator = $("#newCiudad").validate({
	// Define the rules of the form
	rules : {
		/**
		id : {
			required : true,
			minvalue: 1,
			minlength : 4,
			maxlength : 15,
			loginFormat : true 
		},
		*/
		nombre : {
			required : true,
			maxlength : 50
		},
		cpostal : {
			type : int
		}
	},
	// Define the messages for the rules
	messages : {
		nombre : {
			required : "Introduce un nombre",
			maxlength : $.validator.format("El nombre no puede tener más de {0} carácteres"),
		},
		cpostal : {
			required : "Introduce un código postal",
			type : "El código postal debe contener solo números"
		}
	},
	errorPlacement : function(error, element) {
		error.insertAfter(element);
	},
	submitHandler : function(form) {
		form.submit();
	}
});
