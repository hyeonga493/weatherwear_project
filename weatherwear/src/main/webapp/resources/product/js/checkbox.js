/**
 * 
 */
 
$(function(){
	$("#checkAllId").click(function(){
		$(".checkClass").prop("checked", this.checked);
	});
});

// 삭제 기능
function deleteFunction(){
	let deleteList = "";
	
	$(".checkClass:checked").each(function(num, item){
		
		if(num == 0){
			deleteList += item.value;
		} else {
			deleteList += "," + item.value;
		}
		$(item).parent().empty();
	});
	$("input[name='deleteList']").val(deleteList);
	console.log(deleteList);
	console.log($("input[name='deleteList']").val());
}	

// 값넘기기 기능
function submitFunction(){
	let selectList = "";
	
	$(".checkClass:checked").each(function(num, item){
		$(item).parent().remove();
		
		if(num == 0){
			selectList += item.value;
		} else {
			selectList += "," + item.value;
		}
	});
	$("input[name='selectList']").val(selectList);
	console.log("선택 리스트 : " + selectList);
}