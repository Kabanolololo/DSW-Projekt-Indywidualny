document.addEventListener("DOMContentLoaded", () => {
  const todoInput = document.getElementById("todo-input");
  const addBtn = document.getElementById("add-btn");
  const todoList = document.getElementById("todo-list");
  const filterSelect = document.getElementById("filter-select");
  const clearCompletedBtn = document.getElementById("clear-completed-btn");
  const taskCount = document.getElementById("task-count");
  const completedCount = document.getElementById("completed-count");

  // Funkcja do zapisywania zadań w LocalStorage
  const saveTasksToLocalStorage = (tasks) => {
    localStorage.setItem("tasks", JSON.stringify(tasks));
  };

  // Funkcja do pobierania zadań z LocalStorage
  const loadTasksFromLocalStorage = () => {
    const tasks = localStorage.getItem("tasks");
    return tasks ? JSON.parse(tasks) : [];
  };

  // Funkcja do renderowania zadań na liście
  const renderTasks = (tasks) => {
    todoList.innerHTML = ""; // Wyczyszczenie listy
    let completedTasksCount = 0;

    tasks.forEach((task, index) => {
      if (filterSelect.value === "completed" && !task.completed) return;
      if (filterSelect.value === "uncompleted" && task.completed) return;

      const li = document.createElement("li");
      li.className = task.completed ? "completed" : "";
      li.innerHTML = `
        <span>${task.text}</span>
        <button class="edit-btn">Edit</button>
        <button class="delete-btn">Delete</button>
      `;

      // Oznaczanie jako ukończone
      li.addEventListener("click", () => {
        tasks[index].completed = !tasks[index].completed;
        saveTasksToLocalStorage(tasks);
        renderTasks(tasks);
      });

      // Edytowanie zadania
      li.querySelector(".edit-btn").addEventListener("click", (e) => {
        e.stopPropagation();
        const newText = prompt("Edit task:", task.text);
        if (newText !== null) {
          tasks[index].text = newText.trim();
          saveTasksToLocalStorage(tasks);
          renderTasks(tasks);
        }
      });

      // Usuwanie zadania
      li.querySelector(".delete-btn").addEventListener("click", (e) => {
        e.stopPropagation();
        tasks.splice(index, 1);
        saveTasksToLocalStorage(tasks);
        renderTasks(tasks);
      });

      todoList.appendChild(li);
      if (task.completed) completedTasksCount++;
    });

    // Aktualizowanie liczników
    taskCount.textContent = `Total tasks: ${tasks.length}`;
    completedCount.textContent = `Completed tasks: ${completedTasksCount}`;
  };

  // Inicjalizacja aplikacji
  const tasks = loadTasksFromLocalStorage();
  renderTasks(tasks);

  // Dodawanie nowego zadania
  addBtn.addEventListener("click", () => {
    const taskText = todoInput.value.trim();
    if (taskText) {
      tasks.push({ text: taskText, completed: false });
      saveTasksToLocalStorage(tasks);
      renderTasks(tasks);
      todoInput.value = ""; // Czyszczenie pola input
    }
  });

  // Filtrowanie zadań
  filterSelect.addEventListener("change", () => {
    renderTasks(tasks);
  });

  // Czyszczenie ukończonych zadań
  clearCompletedBtn.addEventListener("click", () => {
    const incompleteTasks = tasks.filter(task => !task.completed);
    saveTasksToLocalStorage(incompleteTasks);
    renderTasks(incompleteTasks);
  });
});
