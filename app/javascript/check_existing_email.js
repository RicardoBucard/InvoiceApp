const email = document.querySelector('#user_email');
const submitButton = document.querySelector('#submit_button');
const dialog_message = document.querySelector('#dialog_message');
const url = '/email_already_exists'
let timer = null;

email.addEventListener("input", () => {
  let emailToCheck = email.value.toLowerCase().trim();
  fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
      },
      body: JSON.stringify({
        email: emailToCheck
      }),
  }).then(response => response.json())
  .then(result => {
    if (result.email_already_exists){
      const node = document.createAttribute('data-turbo-confirm')
      node.value = 'Are you sure you want to create a new authentication token?'
      submitButton.setAttributeNode(node)
    }
  })
});

