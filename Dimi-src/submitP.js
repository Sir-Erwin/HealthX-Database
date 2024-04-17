// Get references to the input fields and the submit button
const emailInput = document.getElementById('emailInput');
const passwordInput = document.getElementById('passwordInput');
const loginButton = document.getElementById('loginButton');

// Function to check if all input fields are filled
function validateForm() {
  if (emailInput.value.trim() !== '' && 
      passwordInput.value.trim() !== '') {
    loginButton.disabled = false; // Enable the button if all fields are filled
  } else {
    loginButton.disabled = true; // Disable the button if any field is empty
  }
}

// Add event listeners to input fields to validate the form whenever they change
emailInput.addEventListener('input', validateForm);
passwordInput.addEventListener('input', validateForm);

document.getElementById("passwordInput").addEventListener("keyup", function(event) {
  // Check if the Enter key (key code 13) is pressed
  if (event.key === "Enter") {
    // Prevent the default behavior of form submission
    event.preventDefault();
    // Simulate a click on the anchor link to navigate to the anchor
    document.getElementById("loginButton").click();
  }
});
