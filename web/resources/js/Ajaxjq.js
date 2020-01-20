/*  $(document).ready(function() {
     
              $('input[type="button"]').click(function() {
                  console.log("You click the button with the id ::"+this.id);
                });
            });
           */
           
           function test () {
            console.log("i am here");
              $('button[type="button"]').click(function() {
                 str = $('input[name^='+this.id+']').val();
                 alert(str);
                 
                 /*
                  * 
                  * 
                  * here we will add ajax part 
                  */
                });
};

test();