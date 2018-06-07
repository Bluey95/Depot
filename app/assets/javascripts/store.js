$(document).on "ready page:change", -> 
console.log('ready or page change') 
$(".store .entry > h3").not(".clickable").addClass("clickable").click -> 
console.log('image clicked') 
$(this).parent().find(':submit').click()
