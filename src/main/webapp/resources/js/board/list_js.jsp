<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	var temp;
	var typeoption;
    var keywordtext;
	//제목 길이 길면 자르는 함수 ////////////////////////////
	function cutTitle(){
		var tempTitle = $(".smallList");
		var tempLongTitle = $(".bigList");
		var tempCutTitle;
		
	 	for(var i=0 ; i<tempTitle.length ; i++){
			if($(tempTitle[i]).text().length > 15){
				tempCutTitle = $(tempTitle[i]).text().substring(0,16) + "...";
				$(tempTitle[i]).text(tempCutTitle);
			}
		}
	 	
	 	for(var i=0 ; i<tempLongTitle.length ; i++){
			if($(tempLongTitle[i]).text().length > 25){
				tempCutTitle = $(tempLongTitle[i]).text().substring(0,25) + "...";
				$(tempLongTitle[i]).text(tempCutTitle);
			}
		}
	}
	
	cutTitle();

	//제목 길이 길면 자르는 함수 //
	
	//서울 새소식 json 파싱 //////////////////////////////////
	var newsInfo = ${newsInfo};
	var newsHeader;
	var newsContent;
	for(var i = 0; i < 5 ; i++){
		newsHeader = newsInfo[i].POST_TITLE;
		newsContent = newsInfo[i].POST_CONTENT;
		$("#seoulNews").append("<div class='newsDiv'><p data-toggle='modal' data-target='#newsModal'>"+newsInfo[i].POST_TITLE+"</p><div style='display:none'>"+newsInfo[i].POST_CONTENT+"</div>")
	}
	
	$(document).on("click",".newsDiv p",function(){
		$("#newsHeader").text($(this).text());
		$("#newsContent").html($(this).next().html());
	})
	// 서울 새소식 json 파싱 //
	
	//서울 새소식 애니메이션/////////////////////////////
	$(".newsDiv").hide();
	$(".newsDiv:nth-child(2)").show();
	function newsAnimation(){
		setTimeout(function(){
			$(".newsDiv:nth-child(2)").slideUp();
			$(".newsDiv:nth-child(3)").slideDown(1000);
			setTimeout(function(){
				$(".newsDiv:nth-child(3)").slideUp();
				$(".newsDiv:nth-child(4)").slideDown(1000);
				setTimeout(function(){
					$(".newsDiv:nth-child(4)").slideUp();
					$(".newsDiv:nth-child(5)").slideDown(1000);
					setTimeout(function(){
						$(".newsDiv:nth-child(5)").slideUp();
						$(".newsDiv:nth-child(6)").slideDown(1000);
						setTimeout(function(){
							$(".newsDiv:nth-child(6)").slideUp();
							$(".newsDiv:nth-child(2)").slideDown(1000);
							setTimeout(5000);
						},5000)
					},5000)
				},5000)
			},5000)
		},5000)
	}
	
	function startNewsAnimation(){
		newsAnimation();
		setInterval(newsAnimation,29000);
	}
	startNewsAnimation();
	//서울 새소식 애니메이션//
	
    var actionForm = $("#actionForm");
    
    $(".paginate_button a").on("click", function(e){
  	  e.preventDefault();
  	  
  	  actionForm.find("input[name='pageNum']").val($(this).attr("href"));
  	  actionForm.submit();
    });	
    
    
    $(".pagination").on("click",".page-link", function(e){
  	  e.preventDefault();
  	  	var pageNumber = $(this).html();
  	  	var lastNumber;
  	  	if(pageNumber == "Next"){
  	  		console.log($($(this).parents().prev()[0]).text());
  	  		lastNumber = $($(this).parents().prev()[0]).text();
  	  		lastNumber = Number(lastNumber) + 1;
  	  		pageNumber = lastNumber;
  	  	} 
  	  	if(pageNumber == "Previous"){
  	  		console.log($($(this).parents().next()[0]).text());
  	  		lastNumber = $($(this).parents().next()[0]).text();
  	  		lastNumber = Number(lastNumber) - 1;
  	  		pageNumber = lastNumber;
  	  	}
  		var str="";
  	    var form = {
  	            category:temp,
  	            gu:'${criteria.gu}',
  	            pageNum:pageNumber,
  	         	type:typeoption,
  	          	keyword:keywordtext,
  	          	amount:'${criteria.amount}'
  	          	
  	    }
  	    console.log(form);
  	  
  	    if(temp=='소통해요'){
  	        $.ajax({
  	            url: "/board/BoardTabListAjax",
  	            type: "GET",
  	            data: form,
  	            success: function(data){
  	            	
  	                $("#menu1 tbody").empty();
  	                
  	                $(data.voList).each(function(i,board){
  	                     $("#menu1 tbody").append( 
  	                    			"<tr>"+
  	    							"<td>"+board.bno+"</td>"+
  	    							"<td>"+board.location+"</td>"+
  	    							"<td>"+board.category+"</td>"+
  	    							"<td><a class='move' href='"+board.bno+"'>"+board.title+"</a>"+
  	    							"<b>["+board.reply_count+"]</b>"+
  	    							"</td>"+
  	    							"<td>"+board.nickname+"</td>"+
  	    							"<td>"+board.view_count+"</td>"+
  	    							"<td>"+board.like_count+"</td>"+
  	    							"</tr>" 
  	                    )                                                                        
  	                });
  	                if(data.pagedto.prev){
  	                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
  	                 }
  	                 
  	                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
  	                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
  	                    
  	                 }
  	                 
  	                 if(data.pagedto.next){
  	                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
  	                 }
  	                 
  	                 
  	                $(".pagination").html(str);
  	                cutTitle(); //제목 길면 자름
  	            },
  	            error: function(){
  	                alert("simpleWithObject err");
  	            }
  	        });
  	        
  	        
  	        }else if(temp=='불만있어요'){
  	            $.ajax({
  	                url: "/board/BoardTabListAjax",
  	                type: "GET",
  	                data: form,
  	                success: function(data){
  	                	
  	                    $("#menu2 tbody").empty();
  	                    $(data.voList).each(function(i,board){
  	                         $("#menu2 tbody").append(
  	                     			"<tr>"+
  	    							"<td>"+board.bno+"</td>"+
  	    							"<td>"+board.location+"</td>"+
  	    							"<td>"+board.category+"</td>"+
  	    							"<td><a class='move bigList' href='"+board.bno+"'>"+board.title+"</a>"+
  	    							"<b>["+board.reply_count+"]</b>"+
  	    							"</td>"+
  	    							"<td>"+board.nickname+"</td>"+
  	    							"<td>"+board.view_count+"</td>"+
  	    							"<td>"+board.like_count+"</td>"+
  	    							"</tr>" 	
  	                        )    
  	                    });
  	                    if(data.pagedto.prev){
  	                        str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
  	                     }
  	                     
  	                     for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
  	                        str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
  	                        
  	                     }
  	                     
  	                     if(data.pagedto.next){
  	                        str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
  	                     }
  	                     
  	                     
  	                    $(".pagination").html(str);
  	                    cutTitle(); //제목 길면 자름
  	                },
  	                error: function(){
  	                    alert("simpleWithObject err");
  	                }
  	            });
  	        }else if(temp=='모여요'){
  	            $.ajax({
  	                url: "/board/BoardTabListAjax",
  	                type: "GET",
  	                data: form,
  	                success: function(data){
  	                	
  	                    $("#menu3 tbody").empty();
  	                    $(data.voList).each(function(i,board){
  	                         $("#menu3 tbody").append(
  	                     			"<tr>"+
  	    							"<td>"+board.bno+"</td>"+
  	    							"<td>"+board.location+"</td>"+
  	    							"<td>"+board.category+"</td>"+
  	    							"<td><a class='move bigList' href='"+board.bno+"'>"+board.title+"</a>"+
  	    							"<b>["+board.reply_count+"]</b>"+
  	    							"</td>"+
  	    							"<td>"+board.nickname+"</td>"+
  	    							"<td>"+board.view_count+"</td>"+
  	    							"<td>"+board.like_count+"</td>"+
  	    							"</tr>" 	
  	                        )    
  	                    });
  	                    if(data.pagedto.prev){
  	                        str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
  	                     }
  	                     
  	                     for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
  	                        str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
  	                        
  	                     }
  	                     
  	                     if(data.pagedto.next){
  	                        str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
  	                     }
  	                     
  	                    
  	                    $(".pagination").html(str);
  	                    cutTitle(); //제목 길면 자름
  	                },
  	                error: function(){
  	                    alert("simpleWithObject err");
  	                }
  	            });
  	        }else if(temp=='전체'){
  	            $.ajax({
  	                url: "/board/BoardTabListAjax",
  	                type: "GET",
  	                data: form,
  	                success: function(data){
  	                	
  	                    $("#all tbody").empty();
  	                    $(data.voList).each(function(i,board){
  	                         $("#all tbody").append(
  	                     			"<tr>"+
  	    							"<td>"+board.bno+"</td>"+
  	    							"<td>"+board.location+"</td>"+
  	    							"<td>"+board.category+"</td>"+
  	    							"<td><a class='move bigList' href='"+board.bno+"'>"+board.title+"</a>"+
  	    							"<b>["+board.reply_count+"]</b>"+
  	    							"</td>"+
  	    							"<td>"+board.nickname+"</td>"+
  	    							"<td>"+board.view_count+"</td>"+
  	    							"<td>"+board.like_count+"</td>"+
  	    							"</tr>" 
  	                        )    
  	                    });
  	                    if(data.pagedto.prev){
  	                        str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
  	                     }
  	                     
  	                     for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
  	                        str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
  	                        
  	                     }
  	                     
  	                     if(data.pagedto.next){
  	                        str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
  	                     }
  	                     
  	                     
  	                    $(".pagination").html(str);
  	                    cutTitle(); //제목 길면 자름
  	                },
  	                error: function(){
  	                    alert("simpleWithObject err");
  	                }
  	            });
  	        }else{
  	        $.ajax({
  	            url: "/board/BoardTabListAjax",
  	            type: "GET",
  	            data: form,
  	            success: function(data){
  	            	
  	                $("#all tbody").empty();
  	                console.log(data);
  	                $(data.voList).each(function(i,board){
  	                     $("#all tbody").append(
  	                 			"<tr>"+
  								"<td>"+board.bno+"</td>"+
  								"<td>"+board.location+"</td>"+
  								"<td>"+board.category+"</td>"+
  								"<td><a class='move bigList' href='"+board.bno+"'>"+board.title+" </a>"+
  								"<b>["+board.reply_count+"]</b>"+
  								"</td>"+
  								"<td>"+board.nickname+"</td>"+
  								"<td>"+board.view_count+"</td>"+
  								"<td>"+board.like_count+"</td>"+
  								"</tr>" 
  	                    )    
  	                });
  	                if(data.pagedto.prev){
  	                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
  	                 }
  	                 
  	                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
  	                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
  	                    
  	                 }
  	                 
  	                 if(data.pagedto.next){
  	                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
  	                 }
  	                 
  	                 console.log(str);
  	                $(".pagination").html(str);
  	            },
  	            error: function(){
  	                alert("simpleWithObject err");
  	            }
  	        });
  	    }
    });
    
    var searchForm = $("#searchForm");
    $("#searchForm button").on("click", function(e){
    	
  	  if(!searchForm.find("option:selected").val()){
  		  alert("검색종류를 선택하세요");
  		  return false;
  	  }
  	  if(!searchForm.find("input[name='keyword']").val()){
  		  alert("키워드를 입력하세요");
  		  return false;
  	  }
  	  searchForm.find("input[name='pageNum']").val("1");
  	  e.preventDefault();
  	  
  	typeoption = $("select[name=type]").val(); 
  	keywordtext = $('#keyword').val();
  	var str="";
    var form = {
	            category:temp,
  	            gu:'${criteria.gu}',
  	          	pageNum:1,
  	            type:typeoption,
  	          	keyword:keywordtext,
  	          	amount:'${criteria.amount}'
    }
    console.log(form);
	
  	  
    if(temp=='소통해요'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#menu1 tbody").empty();
                
                console.log(data);
                $(data.voList).each(function(i,board){
                     $("#menu1 tbody").append( 
                    			"<tr>"+
    							"<td>"+board.bno+"</td>"+
    							"<td>"+board.location+"</td>"+
    							"<td>"+board.category+"</td>"+
    							"<td><a class='move smallList' href='"+board.bno+"'>"+board.title+" </a>"+
    							"<b>["+board.reply_count+"]</b>"+
    							"</td>"+
    							"<td>"+board.nickname+"</td>"+
    							"<td>"+board.view_count+"</td>"+
    							"<td>"+board.like_count+"</td>"+
    							"</tr>" 
                    )                                                                        
                });
                if(data.pagedto.prev){
                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
                 }
                 
                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
                    
                 }
                 
                 if(data.pagedto.next){
                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
                 }
                 
                 console.log(str);
                $(".pagination").html(str);
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }else if(temp=='불만있어요'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#menu2 tbody").empty();
                $(data.voList).each(function(i,board){
                     $("#menu2 tbody").append(
                 			"<tr>"+
							"<td>"+board.bno+"</td>"+
							"<td>"+board.location+"</td>"+
							"<td>"+board.category+"</td>"+
							"<td><a class='move smallList' href='"+board.bno+"'>"+board.title+" </a>"+
							"<b>["+board.reply_count+"]</b>"+
							"</td>"+
							"<td>"+board.nickname+"</td>"+
							"<td>"+board.view_count+"</td>"+
							"<td>"+board.like_count+"</td>"+
							"</tr>" 	
                    )    
                });
                if(data.pagedto.prev){
                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
                 }
                 
                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
                    
                 }
                 
                 if(data.pagedto.next){
                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
                 }
                 
                 console.log(str);
                $(".pagination").html(str);
                
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }else if(temp=='모여요'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#menu3 tbody").empty();
                $(data.voList).each(function(i,board){
                     $("#menu3 tbody").append(
                 			"<tr>"+
							"<td>"+board.bno+"</td>"+
							"<td>"+board.location+"</td>"+
							"<td>"+board.category+"</td>"+
							"<td><a class='move smallList' href='"+board.bno+"'>"+board.title+" </a>"+
							"<b>["+board.reply_count+"]</b>"+
							"</td>"+
							"<td>"+board.nickname+"</td>"+
							"<td>"+board.view_count+"</td>"+
							"<td>"+board.like_count+"</td>"+
							"</tr>" 	
                    )    
                });
                if(data.pagedto.prev){
                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
                 }
                 
                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
                    
                 }
                 
                 if(data.pagedto.next){
                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
                 }
                 
                 console.log(str);
                $(".pagination").html(str);
                
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }else if(temp=='전체'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#all tbody").empty();
                console.log(data);
                $(data.voList).each(function(i,board){
                     $("#all tbody").append(
                 			"<tr>"+
							"<td>"+board.bno+"</td>"+
							"<td>"+board.location+"</td>"+
							"<td>"+board.category+"</td>"+
							"<td><a class='move bigList' href='"+board.bno+"'>"+board.title+" </a>"+
							"<b>["+board.reply_count+"]</b>"+
							"</td>"+
							"<td>"+board.nickname+"</td>"+
							"<td>"+board.view_count+"</td>"+
							"<td>"+board.like_count+"</td>"+
							"</tr>" 
                    )    
                });
                if(data.pagedto.prev){
                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
                 }
                 
                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
                    
                 }
                 
                 if(data.pagedto.next){
                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
                 }
                 
                 console.log(str);
                $(".pagination").html(str);
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }else{
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#all tbody").empty();
                console.log(data);
                $(data.voList).each(function(i,board){
                     $("#all tbody").append(
                 			"<tr>"+
							"<td>"+board.bno+"</td>"+
							"<td>"+board.location+"</td>"+
							"<td>"+board.category+"</td>"+
							"<td><a class='move bigList' href='"+board.bno+"'>"+board.title+" </a>"+
							"<b>["+board.reply_count+"]</b>"+
							"</td>"+
							"<td>"+board.nickname+"</td>"+
							"<td>"+board.view_count+"</td>"+
							"<td>"+board.like_count+"</td>"+
							"</tr>" 
                    )    
                });
                if(data.pagedto.prev){
                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
                 }
                 
                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
                    
                 }
                 
                 if(data.pagedto.next){
                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
                 }
                 
                 console.log(str);
                $(".pagination").html(str);
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }
    
    });
    
    $("#regBtn").on("click", function(){
        self.location = "/board/register";
     });
    
    $("tbody").on('click', '.move',function(e){
        e.preventDefault();
        actionForm.attr("action","/board/read/"+$(this).attr('href'));
        actionForm.submit();
     
 });
    
    var searchFormNum = $("#searchFormNum");
    
    $("#searchFormNum").on("change", function(e){
  	  e.preventDefault();
  	  
  	  searchFormNum.submit();
  	  
    });
    $('a[data-toggle="tab"]').on('show.bs.tab',function(e){
    	typeoption = null;
      	keywordtext = null;
    	var str="";
    	temp = $(this).html();
        var form = {
                category :temp,
                gu:'${criteria.gu}',
                amount:'${criteria.amount}'
        }
    
    if(temp=='소통해요'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#menu1 tbody").empty();
                
                console.log(data);
                $(data.voList).each(function(i,board){
                     $("#menu1 tbody").append( 
                    			"<tr>"+
    							"<td>"+board.bno+"</td>"+
    							"<td>"+board.location+"</td>"+
    							"<td>"+board.category+"</td>"+
    							"<td><a class='move smallList' href='"+board.bno+"'>"+board.title+" </a>"+
    							"<b>["+board.reply_count+"]</b>"+
    							"</td>"+
    							"<td>"+board.nickname+"</td>"+
    							"<td>"+board.view_count+"</td>"+
    							"<td>"+board.like_count+"</td>"+
    							"</tr>" 
                    )                                                                        
                });
                if(data.pagedto.prev){
                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
                 }
                 
                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
                    
                 }
                 
                 if(data.pagedto.next){
                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
                 }
                 
                 console.log(str);
                $(".pagination").html(str);
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }else if(temp=='불만있어요'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#menu2 tbody").empty();
                $(data.voList).each(function(i,board){
                     $("#menu2 tbody").append(
                 			"<tr>"+
							"<td>"+board.bno+"</td>"+
							"<td>"+board.location+"</td>"+
							"<td>"+board.category+"</td>"+
							"<td><a class='move smallList' href='"+board.bno+"'>"+board.title+" </a>"+
							"<b>["+board.reply_count+"]</b>"+
							"</td>"+
							"<td>"+board.nickname+"</td>"+
							"<td>"+board.view_count+"</td>"+
							"<td>"+board.like_count+"</td>"+
							"</tr>" 	
                    )    
                });
                if(data.pagedto.prev){
                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
                 }
                 
                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
                    
                 }
                 
                 if(data.pagedto.next){
                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
                 }
                 
                 console.log(str);
                $(".pagination").html(str);
                
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }else if(temp=='모여요'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#menu3 tbody").empty();
                $(data.voList).each(function(i,board){
                     $("#menu3 tbody").append(
                 			"<tr>"+
							"<td>"+board.bno+"</td>"+
							"<td>"+board.location+"</td>"+
							"<td>"+board.category+"</td>"+
							"<td><a class='move smallList' href='"+board.bno+"'>"+board.title+" </a>"+
							"<b>["+board.reply_count+"]</b>"+
							"</td>"+
							"<td>"+board.nickname+"</td>"+
							"<td>"+board.view_count+"</td>"+
							"<td>"+board.like_count+"</td>"+
							"</tr>" 	
                    )    
                });
                if(data.pagedto.prev){
                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
                 }
                 
                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
                    
                 }
                 
                 if(data.pagedto.next){
                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
                 }
                 
                 console.log(str);
                $(".pagination").html(str);
                
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }else if(temp=='전체'){
        $.ajax({
            url: "/board/BoardTabListAjax",
            type: "GET",
            data: form,
            success: function(data){
            	
                $("#all tbody").empty();
                console.log(data);
                $(data.voList).each(function(i,board){
                     $("#all tbody").append(
                 			"<tr>"+
							"<td>"+board.bno+"</td>"+
							"<td>"+board.location+"</td>"+
							"<td>"+board.category+"</td>"+
							"<td><a class='move bigList' href='"+board.bno+"'>"+board.title+" </a>"+
							"<b>["+board.reply_count+"]</b>"+
							"</td>"+
							"<td>"+board.nickname+"</td>"+
							"<td>"+board.view_count+"</td>"+
							"<td>"+board.like_count+"</td>"+
							"</tr>" 
                    )    
                });
                if(data.pagedto.prev){
                    str += '<li class="paginate_button previous"><a class="page-link" href="${data.pagedto.startPage -1}">Previous</a></li>';
                 }
                 
                 for(var i = data.pagedto.startPage; i<=data.pagedto.endPage; i++){
                    str += '<li class="paginate_button"><a class="page-link" href="'+i+'">'+i+'</a></li>';
                    
                 }
                 
                 if(data.pagedto.next){
                    str += '<li class="paginate_button"><a class="page-link" href="${data.pagedto.endPage +1}">Next</a></li>';
                 }
                 
                 console.log(str);
                $(".pagination").html(str);
            },
            error: function(){
                alert("simpleWithObject err");
            }
        });
    }
	
});
$('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
	localStorage.setItem('activeTab', $(e.target).attr('href'));
});
var activeTab = localStorage.getItem('activeTab');
if(activeTab){
	$('#mytab a[href="' + activeTab + '"]').tab('show');
}
});

</script>