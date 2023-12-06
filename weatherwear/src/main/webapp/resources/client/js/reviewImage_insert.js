/**
 * 
 */
 $(function(){
    
    //리뷰 이미지 업로드
    $("#reviewImageUpload").change(function(){
        console.log("upload : " + $("#reviewImageUpload")[0].files);
        
        reviewImageList = $("#reviewImageUpload")[0].files;
        reviewlListTag = '';
        
        reviewImageTag = '';
        for(i = 0; i < reviewImageList.length; i++){
            reviewlListTag += "<label for "+reviewImageList[i].name+"> " + reviewImageList[i].name + "</label><br>";
            reviewImageTag += "<img src='"+URL.createObjectURL(reviewImageList[i]) +
            		"' alt='"+reviewImageList[i].name+"' id='" + reviewImageList[i].name + 
            		"' style='width:auto; height:150px;'>";
        }
        
        console.log("tag : " + reviewImageTag);
        console.log("list : " + reviewlListTag);
        $('#review_imageList').html(reviewlListTag);
        $('#reviewImageList').html(reviewImageTag);
    });
});