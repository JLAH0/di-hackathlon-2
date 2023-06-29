document.addEventListener('DOMContentLoaded', function() {
  let loginBtn = document.getElementById('loginBtn');
  let signupBtn = document.getElementById('signupBtn');
  let loginModal = document.getElementById('loginModal');
  let signupModal = document.getElementById('signupModal');
  let closeBtns = document.getElementsByClassName('close');

  function showModal(modal) {
    modal.style.display = 'block';
  }

  function closeModal(modal) {
    modal.style.display = 'none';
  }

  function handleOutsideClick(event) {
    if (event.target === loginModal || event.target === signupModal) {
      closeModal(event.target);
    }
  }

  function handleKeyPress(event) {
    if (event.key === 'Escape') {
      closeModal(loginModal);
      closeModal(signupModal);
    }
  }

  loginBtn.addEventListener('click', function() {
    showModal(loginModal);
  });

  signupBtn.addEventListener('click', function() {
    showModal(signupModal);
  });

  for (let i = 0; i < closeBtns.length; i++) {
    closeBtns[i].addEventListener('click', function() {
      closeModal(this.parentElement.parentElement);
    });
  }

  document.addEventListener('click', handleOutsideClick);
  document.addEventListener('keydown', handleKeyPress);

  let loginForm = document.getElementById('loginForm');
  loginForm.addEventListener('submit', function(event) {
    event.preventDefault();

    let emailOrUsername = document.getElementById('loginEmail').value;
    let password = document.getElementById('loginPassword').value;

    alert('Login Credentials:\nEmail/Username: ' + emailOrUsername);

    closeModal(loginModal);

    // Make an AJAX request here if needed

    // Redirect to project.html
    window.location.href = 'project.html';
  });

  let signupForm = document.getElementById('signupForm');
  signupForm.addEventListener('submit', function(event) {
    event.preventDefault();

    let name = document.getElementById('signupName').value;
    let surname = document.getElementById('signupSurname').value;
    let email = document.getElementById('signupEmail').value;
    let username = document.getElementById('signupUsername').value;
    let password = document.getElementById('signupPassword').value;

    fetch('/signup', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        name: name,
        surname: surname,
        email: email,
        username: username,
        password: password
      })
    })
      .then(function(response) {
        if (!response.ok) {
          throw new Error('Request failed with status ' + response.status);
        }
        return response.json();
      })
      .then(function(data) {
        if (data.success === true) {
          alert(data.message);
          closeModal(signupModal);
        } else {
          alert(data.message);
        }
      })
      .catch(function(error) {
        console.error('Error:', error);
        alert('An error occurred during the request.');
      });
  });
});


/* Project Management */

document.addEventListener('DOMContentLoaded', function() {

  let logoutBtn = document.getElementById('logoutBtn');
  logoutBtn.addEventListener('click', function() {
    localStorage.clear();

    window.location.href = 'index.html';
  });


  let projectForm = document.getElementById('projectForm');
  projectForm.addEventListener('submit', function(event) {
    event.preventDefault();

    let projectName = document.getElementById('projectName').value;

    // Perform project creation logic, such as making API requests, database operations, etc.
    // Example: Adding the project to the project list
    addProjectToList(projectName);

    // Clear the form input field
    projectForm.reset();
  });

  // Function to add a project to the project list
  function addProjectToList(projectName) {
    let projectList = document.getElementById('projectList');
    let li = document.createElement('li');
    li.textContent = projectName;
    projectList.appendChild(li);
  }
});

/* to do list */

document.addEventListener('DOMContentLoaded', function() {
  // Logout button click event handler
  let logoutBtn = document.getElementById('logoutBtn');
  logoutBtn.addEventListener('click', function() {
    // Perform logout logic, such as clearing session data, redirecting to login page, etc.
    // Example: Redirecting to the login page
    window.location.href = 'login.html';
  });

  // Task form submission event handler
  let taskForm = document.getElementById('taskForm');
  taskForm.addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent the form from submitting normally

    let taskName = document.getElementById('taskName').value;
    let taskPriority = document.getElementById('taskPriority').value;
    let taskCategory = document.getElementById('taskAssignee').value;
    let taskDueDate = document.getElementById('taskDueDate').value;
    let taskDescription = document.getElementById('taskDescription').value;
    let taskStatus = document.getElementById('taskStatus').value;

    // Perform task creation logic, such as making API requests, database operations, etc.
    // Example: Adding the task to the task list
    addTaskToList(taskName, taskPriority, taskCategory, taskDueDate, taskDescription, taskStatus);

    // Clear the form input fields
    taskForm.reset();
  });

  // Search button click event handler
  let searchButton = document.getElementById('searchButton');
  searchButton.addEventListener('click', function() {
    let searchInput = document.getElementById('searchInput').value;

    // Perform search logic, such as filtering tasks based on search input
    // Example: Searching tasks by name
    searchTasks(searchInput);
  });

  // Function to add a task to the task list
  function addTaskToList(name, priority, category, dueDate, description, status) {
    let taskList = document.getElementById('taskList');
    let taskElement = document.createElement('div');
    taskElement.classList.add('task');

    let nameElement = document.createElement('div');
    nameElement.classList.add('name');
    nameElement.textContent = name;
    taskElement.appendChild(nameElement);

    let priorityElement = document.createElement('div');
    priorityElement.classList.add('priority');
    priorityElement.textContent = 'Priority: ' + priority;
    taskElement.appendChild(priorityElement);

    if (category) {
      let categoryElement = document.createElement('div');
      categoryElement.classList.add('category');
      categoryElement.textContent = 'Category: ' + category;
      taskElement.appendChild(categoryElement);
    }

    if (dueDate) {
      let dueDateElement = document.createElement('div');
      dueDateElement.classList.add('due-date');
      dueDateElement.textContent = 'Due Date: ' + dueDate;
      taskElement.appendChild(dueDateElement);
    }

    if (description) {
      let descriptionElement = document.createElement('div');
      descriptionElement.classList.add('description');
      descriptionElement.textContent = 'Description: ' + description;
      taskElement.appendChild(descriptionElement);
    }

    if (status) {
      let statusElement = document.createElement('div');
      statusElement.classList.add('status');
      statusElement.textContent = 'Status: ' + status;
      taskElement.appendChild(statusElement);
    }

    taskList.appendChild(taskElement);
  }

  // Function to search tasks
  function searchTasks(searchInput) {
    let tasks = document.getElementsByClassName('task');
    for (var i = 0; i < tasks.length; i++) {
      let task = tasks[i];
      let nameElement = task.querySelector('.name');
      let taskName = nameElement.textContent.toLowerCase();

      if (taskName.includes(searchInput.toLowerCase())) {
        task.style.display = 'block'; // Show the task if it matches the search
      } else {
        task.style.display = 'none'; // Hide the task if it doesn't match the search
      }
    }
  }
});
