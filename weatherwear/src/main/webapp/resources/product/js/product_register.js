/**
 * 
 */
//옵션 적용하기
$(document).ready(function() {
	$("#applyOption").click(function() {
		var proId = $("input[name='proId']").val();
		var opColor = $("input[name='opColor']").val().replace(/\s/g, '');
		var opSize = $("input[name='opSize']").val().replace(/\s/g, '');
		var opColorList = [];
		var opSizeList = [];
		
		if (opColor) {
			opColor.split(",").forEach(function(item) {
				opColorList.push(item);
				$("input[name='opColorList']").val(opColorList);
			});
		}
	
		if (opSize) {
			opSize.split(",").forEach(function(item) {
				opSizeList.push(item);
				$("input[name='opSizeList']").val(opSizeList);
			});
		}
		$("#optionResult").html("<font color='blue' size='3'>적용되었습니다.</font>");

		$("#optionStock").html("<form action='insertStock.mdo' method='post'>" 
								+ "<table style='text-align:center;'>" 
								+ "<thead>" 
								+ "<tr style='border-bottom:1px solid grey;'>" 
								+ "<th style='width:80px'>색상</th><th style='width:80px'>사이즈</th><th style='width:80px'>재고</th>" 
								+ "</tr>" 
								+ "</thead>" 
								+ "<tbody></tbody>" 
								+ "</table>" 
								+ "</form>"
								+ "<input type='number' name='changeall'><button type='button' class='btn-write' id='changeStockAll'>일괄적용하기</button><br>"
								+ "<button type='button' class='btn-write' id='applyStock'>재고 저장하기</button>" 
								+ "<input type='hidden' name='stCntList' value='${ stCntList }'>"
								+ "<span id='stockResult'></span>");
		for(var i=0; i<opColorList.length; i++){
			
			for(var j=0; j<opSizeList.length; j++){
				$("#optionStock table tbody:last").append("<tr style='border-bottom:1px solid grey;'><td>" + opColorList[i] + "</td><td>" + opSizeList[j] + "</td><td>" 
						+ "<input type='number' name='stCnt' id='stCnt" + opColorList[i] + opSizeList[j] + "' value='0' min='0' style='width:40px; text-alin:center; border:none;'></td></tr>");	
			}
		}
		
		console.log("opColorList : " + opColorList);
		console.log("opSizeList : " + opSizeList);
		
		$("#applyStock").click(function() {
			var stCntList = [];
			for(var i=0; i<opColorList.length; i++){
				for(var j=0; j<opSizeList.length; j++){
					var cnt = $("#stCnt"+ opColorList[i] + opSizeList[j] + "").val();
					
					if(cnt<0){
						alert("재고는 0개 이상이어야 합니다.");
						$("#stCnt"+ opColorList[i] + opSizeList[j] + "").val('0');
						return;
					}
					stCntList.push(cnt);
				}
			}
			console.log("stCntList : " + stCntList);
			$("input[name='stCntList']").val(stCntList);

			if(stCntList!=null){
				$("#stockResult").html("<font color='blue' size='3'>적용되었습니다.</font>");
			}
		});
		
		$("#changeStockAll").click(function() {
			var stCntList = [];
			for(var i=0; i<opColorList.length; i++){
				for(var j=0; j<opSizeList.length; j++){
					var cnt = $("input[name='changeall']").val();

					stCntList.push(cnt);
					$("#stCnt"+ opColorList[i] + opSizeList[j] + "").val(cnt);
				}
			}
			console.log("stCntList : " + stCntList);
			$("input[name='stCntList']").val(stCntList);
			
			if(stCntList!=null){
				$("#stockResult").html("<font color='blue' size='3'>일괄 적용되었습니다.</font>");
			}
		});
	});
});