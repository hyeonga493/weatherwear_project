/**
 * 
 */
$(function(){
    
    //상세 이미지 업로드
    $("#noticeImageUpload").change(function(){
        
    	noticeImageList = $("#noticeImageUpload")[0].files;
    	noticeListTag = '';
        
        noticeImageTag = '';
        for(i = 0; i < noticeImageList.length; i++){
        	noticeListTag += "<label for "+noticeImageList[i].name+"> " + noticeImageList[i].name + "</label><br>";
            noticeImageTag += "<img src='"+URL.createObjectURL(noticeImageList[i]) +
            		"' alt='"+noticeImageList[i].name+"' id='" + noticeImageList[i].name + 
            		"' style='width:auto; height:150px;'>";
        }
        $('#notice_imageList').html(noticeListTag);
        $('#noticeImageList').html(noticeImageTag);
    });
});