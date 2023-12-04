/**
 * 
 */
$(function(){
    //여기부터
    $("#fileUpload").change(function(){
        console.log($("#fileUpload")[0].files);
        
        fileList = $("#fileUpload")[0].files;
        fileListTag = '';
         
        fileImageTag = '';
        for(i = 0; i < fileList.length; i++){
            fileListTag += "<label for "+fileList[i].name+"> " + fileList[i].name + "</label><br>";
            fileImageTag += "<img src='"+URL.createObjectURL(fileList[i]) +
            		"' alt='"+fileList[i].name+"' id='" + fileList[i].name + 
            		"' style='width:auto; height:150px;'>";
        }
        $('#fileList').html(fileListTag);
        $('#imageList').html(fileImageTag);
    });
    //여기까지 
});