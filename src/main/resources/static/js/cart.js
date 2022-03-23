function selectAll(selectAll) {
  const checkboxes = document.getElementsByName("select");

  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  });
}
