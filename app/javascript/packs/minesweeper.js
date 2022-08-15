$( document ).on('turbolinks:load', function() {
   let bomb = $("#bomb").val()
   if (bomb) {
        alert("Better Luck next time!")
   }
  })