$(document).on('turbolinks:load', function() {
  console.log( "ready!" );
  
  $('select#online_judge_site').selectize({
    create: true,
    closeAfterSelect: true, 
    addPrecedence: true,
    placeholder:"Seleccionar o Agregar Online Judge"
  });

  $( "select#online_judge_site" ).change(function() {
    site = $(this).find(":selected").val();

    label = $("label[for='online_judge_account_name']");
    if (site == "Caribbean Online Judge (COJ)") {
      label.text("Username");
    } else if (site == "UVa Online Judge") {
      label.text("User ID");
    } else if (site == "Sphere Online Judge") {
      label.text("Username");
    } else if (site == "ACM-ICPC Live Archive") {
      label.text("User ID");
    }
  });

  // $("#online_judge_account_name")
});
