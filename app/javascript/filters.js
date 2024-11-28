document.addEventListener("DOMContentLoaded", () => {
    const filterSelect = document.getElementById("status");

    filterSelect.addEventListener("change", () => {
        const form = document.getElementById("filter-form");
        form.submit();
    });
});