document.addEventListener("DOMContentLoaded", function() {
    const modal = document.getElementById('taskModal');
    const modalContent = document.getElementById('modalContent');
    const closeButton = document.querySelector('.close');

    document.querySelectorAll('tr[data-task-id]').forEach(row => {
        row.addEventListener('click', function() {
            const taskId = this.getAttribute('data-task-id');
            
            fetch(`/to_do_lists/${taskId}/show_modal`)
                .then(response => response.text())
                .then(html => {
                    modalContent.innerHTML = html;  
                    modal.style.display = 'flex'; 
                })
                .catch(error => console.error('Error al cargar la tarea:', error));
        });
    });

    closeButton.addEventListener('click', function() {
        modal.style.display = 'none';
    });
});