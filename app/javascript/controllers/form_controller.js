import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  form = null;

  connect() {
    this.form = this.element.querySelector('form');
    this.add_form_validation();
  }

  disconnect() {}

  add_employment(){
    let submit_button = this.form.querySelector('.require-form-validation');
    submit_button.disabled = true;
    submit_button.classList.remove('bg-blue-600');
    submit_button.classList.remove('text-white');
    submit_button.classList.add('bg-gray-300');
    this.form.querySelectorAll('.more_fields').forEach(el => {
      if (el) {
        if (['INPUT'].includes(el.tagName)) {
          el.classList.add('required');
          el.addEventListener('input', this._form_validation);
        }
      }
    })
  }

  remove_employment(){
    let submit_button = this.form.querySelector('.require-form-validation');
    submit_button.disabled = false;
    submit_button.classList.remove('bg-gray-300');
    submit_button.classList.add('bg-blue-600');
    submit_button.classList.add('text-white');
    this.form.querySelectorAll('.more_fields').forEach(el => {
      if (el) {
        if (['INPUT'].includes(el.tagName)) {
          el.classList.remove('required');
          el.addEventListener('input', this._form_validation);
        }
      }
    })
  }

  reloadForm(e){
    this.connect();
  }

  onResetFormValidation(e) {
    e.preventDefault();
    this.add_form_validation();
  }

  add_form_validation() {
    this.required_validation();
    this.phone_validation();
    this._form_validation();
  }

  required_validation() {
    this.form.querySelectorAll('.required').forEach(el => {
      if (el) {
        if (['INPUT'].includes(el.tagName)) {
          el.addEventListener('input', this._form_validation);
        }
      }
    })

    let phone_number = this.form.querySelector('.phone-number');
    if (phone_number) {
      if (!phone_number.className.includes('required')) {
        phone_number.addEventListener('input', this._form_validation);
      }
    }

    let email_address = this.form.querySelector('.email');
    if (email_address) {
      if (!email_address.className.includes('required')) {
        email_address.addEventListener('input', this._form_validation);
      }
    }

    let employer = this.form.querySelector('.employer');
    if (employer) {
      if (!employer.className.includes('required')) {
        employer.addEventListener('input', this._form_validation);
      }
    }

    let start_date = this.form.querySelector('.start_date');
    if (start_date) {
      if (!start_date.className.includes('required')) {
        start_date.addEventListener('input', this._form_validation);
      }
    }

    let emplyment_end_date = this.form.querySelector('.emplyment_end_date');
    if (emplyment_end_date) {
      if (!emplyment_end_date.className.includes('required')) {
        emplyment_end_date.addEventListener('input', this._form_validation);
      }
    }
  }

  phone_validation() {
    if (this.form.querySelector('.phone-number')) {
      this.form.querySelector('.phone-number').addEventListener('input', function() { 
        let text = this.value
        text = text.replace(/\D/g,'')                                              
        if(text.length>3) text = text.replace(/.{3}/,'$&-')                        
        if(text.length>7) text = text.replace(/.{7}/,'$&-')                        
        this.value = text;                                                         
      });
    }
  }

  _form_validation(e) {
    let disabled = false;
    this.form.querySelectorAll('.required').forEach((el) => {

      if (['INPUT'].includes(el.tagName)) {
        if (el.tagName === 'INPUT') {
          if (this.form[el.name].value === null || this.form[el.name].value === '') {
            disabled = true;
            return;
          }
        } else {
          const input_value = el.value.trim();
          if (input_value.length < 1) {
            disabled = true;
            return;
          }
        }
      }
    })

    this.form.querySelectorAll('.first_name').forEach((el) => {
        var fnameError = document.getElementById("fnameError");
        fnameError.innerHTML = "";
        if (['INPUT'].includes(el.tagName) && el.value.length > 25) {
          fnameError.innerHTML = "Please enter maximum 25 charchters.";
          disabled = true;
          return;
        }
    });

    this.form.querySelectorAll('.last_name').forEach((el) => {
      var lnameError = document.getElementById("lnameError");
      lnameError.innerHTML = "";
      if (['INPUT'].includes(el.tagName) && el.value.length > 50) {
        lnameError.innerHTML = "Please enter maximum 50 charchters.";
        disabled = true;
        return;
      }
    });

    this.form.querySelectorAll('.email').forEach((el) => {
      var emailError = document.getElementById("emailError");
      emailError.innerHTML = "";
      if (['INPUT'].includes(el.tagName) && el.value.length > 0 && !(/^\w+([.-]\w+)*@\w+([.-]\w+)*\.\w{2,3}$/.test(el.value))) {
        emailError.innerHTML = "Please enter valid email address.";
        disabled = true;
        return;
      }
    })

    this.form.querySelectorAll('.require-form-validation').forEach(el => {
      el.disabled = disabled;
      if (el.disabled == false) {
        el.classList.remove('bg-gray-300');
        el.classList.add('bg-blue-600');
        el.classList.add('text-white');
      } else if (el.disabled == true) {
        el.classList.remove('bg-blue-600');
        el.classList.remove('text-white');
        el.classList.add('bg-gray-300');        
      }
    })
  }
}