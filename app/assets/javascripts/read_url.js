function readURL(input) {
  var id = input.getAttribute('data_file_id');

  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      $('.img_prev_' + id)
        .attr('src', e.target.result)
        .width(16)
        .height(16);
    };

    reader.readAsDataURL(input.files[0]);
  }
}