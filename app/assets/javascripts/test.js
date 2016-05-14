$(document).ready(function(event){
  $.ajax({url: '/users/1/rounds', datatype: "JSON"
    }).done(function(response){
      //add parse logic, probably
      // args.rounds = response;
      console.log();
  });
});
