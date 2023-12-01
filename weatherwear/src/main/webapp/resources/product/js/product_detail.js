/**
 * 
 */
$(function(){
    //메인 이미지 업로드
    $("#mainImageUpload").change(function(){
        //console.log($("#mainImageUpload")[0].files);
        
        mainImageList = $("#mainImageUpload")[0].files;
        mainListTag = '';
        
        mainImageTag = '';
        for(i = 0; i < mainImageList.length; i++){
            mainListTag += "<label for "+mainImageList[i].name+"> " + mainImageList[i].name + "</label><br>";
            mainImageTag += "<img src='"+URL.createObjectURL(mainImageList[i]) +
            		"' alt='"+mainImageList[i].name+"' id='" + mainImageList[i].name + 
            		"' style='width:auto; height:150px;'>";
        }
        console.log("mainImage : " + mainListTag);
        $('#main_imageList').html(mainListTag);
        $('#mainimageList').html(mainImageTag);
    });
    
    
    //상세 이미지 업로드
    $("#detailImageUpload").change(function(){
        //console.log($("#detailImageUpload")[0].files);
        
        detailImageList = $("#detailImageUpload")[0].files;
        detailListTag = '';
        
        detailImageTag = '';
        for(i = 0; i < detailImageList.length; i++){
            detailListTag += "<label for "+detailImageList[i].name+"> " + detailImageList[i].name + "</label><br>";
            detailImageTag += "<img src='"+URL.createObjectURL(detailImageList[i]) +
            		"' alt='"+detailImageList[i].name+"' id='" + detailImageList[i].name + 
            		"' style='width:auto; height:150px;'>";
        }
        $('#detail_imageList').html(detailListTag);
        $('#detailimageList').html(detailImageTag);
    });
});