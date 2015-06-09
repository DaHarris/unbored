function addIcon(file) {
  $('.sidebar').append('<img src="assets/' + file + '" id="' + file.split(".")[0] + '"class="svg-icons" style="width: 40px"></img>');
}
