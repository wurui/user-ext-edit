define(['require','oxjs'],function(require,OXJS){
  return {
    init:function($mod){
    	//var uploaderAvatar,uploaderImg;
    	//var avatarSrc,imgSrc;
    	var dataCache={},
    	filechange=function(target){
    		var 
    		name=target.name,
    		gen_id=target.id,
    		datacache=dataCache[name];

			if(datacache){
				var uploader=datacache.uploader;
				uploader.fileQ=[];
				uploader.addToQ(target.files,function(arr){
					var src=arr[0]._data;
					//debugger
					dataCache[name].src = src;
					$('label[for='+gen_id+']',$mod).css('backgroundImage','url('+src+')');
					//target.value='';
                });

			}else{
				require(['oxm/wurui/image-uploader/0.3.0/asset/main'],function(uploader_main){
    				dataCache[name] = {uploader:new uploader_main()};
    				filechange(target);
    			})
			}
    	};

    	$('form',$mod).on('change',function(e){
    		//console.log(e.target.name)
    		var tar=e.target;
    		if(tar.type=='file'){
    			filechange(tar);
    		}
    	}).on('submit',function(e){
    		var f=e.target;
    		var backpage=$('#J_referer').val(),
    		cb=function(){
    			location.href=backpage;
    		};
    		try{

    			var data={
    				'user-ext':{
	    				uid:OXJS.getUID(),
	    				avatar:dataCache.file_avatar && dataCache.file_avatar.src,
	    				img:dataCache.file_img && dataCache.file_img.src,
	    				slogan:f.slogan.value,
	    				sex:f.sex.value,
	    				nick:f.nick.value
	    			}
    			}
    			if(f.uid.value){
    				data['user-ext'].$updater='update_all'
    				$mod.OXPut(data,cb)

    			}else{
    				$mod.OXPost(data,cb)
    			}
    			
    		}catch(er){
    			console.log(er)
    		}
    		
    		return false
    	})
    }
  }
})
