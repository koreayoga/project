console.log("Reply Module............");
var replyService = (function(){

	//댓글 추가 Test
	function add(reply, callback, error){
		console.log("reply add---------------");
		
		$.ajax({
			type:'post',
			url : '/replies/new',
			data : JSON.stringify(reply),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr){
						if(callback){
							callback(result);
						}
					  },
			error : function(xhr,status,er) {
						if(error) {
							error(er);
						}
					}
		});		
	}
	
	// 댓글리스트 조회 Test
	function getList(param, callback, error){
		var bno = param.bno;
		var page = param.page || 1;
		
		$.getJSON("/replies/pages/"+bno+"/"+page+".json",
			function(data){
				if(callback){
					// callback(data); // 댓글 리스트만 가져옴
					callback(data.replyCnt, data.list); // 댓글 개수 + 리스트
				}
			}).fail(function(xhr,status,err) {
				if(error){
					error();
				}
			});
	}
	
	
	// 댓글 삭제 Test
	function remove(rno, replyer, callback, error){
		console.log("reply delete---------------");
		
		$.ajax({
			type:'delete',
			url : '/replies/'+rno,	
			data : JSON.stringify({rno:rno, replyer:replyer}),
			contentType : "application/json; charset=utf-8",		
			success : function(deleteResult, status, xhr){
						if(callback){
							callback(deleteResult);
						}
					  },
			error : function(xhr,status,er) {
						if(error) {
							error(er);
						}
					}
		});		
	}
	
	
	// 댓글 수정 Test
	function update(reply, callback, error){
		console.log("RNO: " + reply.rno);
		$.ajax({
			type:'put',
			url : '/replies/' + reply.rno,	
			data : JSON.stringify(reply),	
			contentType : "application/json; charset=utf-8",	
			success : function(result, status, xhr){
						if(callback){
							callback(result);
						}
					  },
			error : function(xhr,status,er) {
						if(error) {
							error(er);
						}
					}
		});	
	}
	
	// 댓글 조회 Test
	function get(rno, callback, error){
			$.get("/replies/"+rno+".json", 
			      function(result){		
						if(callback){
							callback(result);
						}
				  }).fail( function(xhr,status,er) {
						if(error) {
							error(er);
						}
					});
	}
		
	// 시간 포맷 적용
	function displaytime(timeValue){
		var today = new Date();
		var gap = today.getTime() - timeValue;
		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000*60*60*24)) { 
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();
			
			return [ (hh>9 ? '':'0')+hh,':',(mi>9 ? '':'0')+mi,':', (ss > 9 ? '' : '0') + ss ].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();
			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',(dd > 9 ? '' : '0') + dd ].join('');
		}
	}
		
	// 메서드 호출
	return {
		add:add,
		getList : getList,
		remove : remove,
		update : update,
		get : get,
		displaytime : displaytime
	};
	
})();