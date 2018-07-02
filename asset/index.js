define(['require','oxjs'],function(require,OXJS){
  return {
    init:function($mod){
    	var uploaderAvatar,uploaderImg;
    	var avatarSrc,imgSrc;
    	$('form',$mod).on('change',function(e){
    		//console.log(e.target.name)
    		var gen_id=e.target.id;
    		switch(e.target.name){
    			case 'file_avatar':
    			
    			if(uploaderAvatar){
    				uploaderAvatar.fileQ=[];
    				uploaderAvatar.addToQ(e.target.files,function(arr){
    					var src=arr[0]._data;
    					avatarSrc=src;
    					$('label[for='+gen_id+']',$mod).css('backgroundImage','url('+src+')')
                    });
    			}else{
    				require(['oxm/wurui/image-uploader/0.3.0/asset/main'],function(uploader_main){
	    				//console.log(typeof uploader_main);
	    				uploaderAvatar=new uploader_main();

	    				uploaderAvatar.addToQ(e.target.files,function(arr){
	    					var src=arr[0]._data;
	    					avatarSrc=src;
	    					
	    					$('label[for='+gen_id+']',$mod).css('backgroundImage','url('+src+')')
	                    });
	    			})
    			}
    			break
    			case 'file_img':
    			if(uploaderImg){
    				uploaderImg.addToQ(e.target.files,function(arr){
    					var src=arr[0]._data;
    					imgSrc=src;
    					$('label[for='+gen_id+']',$mod).css('backgroundImage','url('+src+')')
                    });
    			}else{
    				require(['oxm/wurui/image-uploader/0.3.0/asset/main'],function(uploader_main){
	    				//console.log(typeof uploader_main);
	    				uploaderImg=new uploader_main();
	    				uploaderImg.addToQ(e.target.files,function(arr){
	    					var src=arr[0]._data;
	    					//debugger
	    					imgSrc=src;
	    					$('label[for='+gen_id+']',$mod).css('backgroundImage','url('+src+')')
	                    });
	    			})
    			}
    			
    			break
    		}
    	}).on('submit',function(e){
    		var f=e.target;
    		try{
    			var data={
    				'user-ext':{
	    				uid:OXJS.getUID(),
	    				avatar:avatarSrc,
	    				img:imgSrc,
	    				slogan:f.slogan.value,
	    				sex:f.sex.value,
	    				nick:f.nick.value
	    			}
    			}

    			$mod.OXPost(data)
    		}catch(er){
    			console.log(er)
    		}
    		
    		return false
    	})
    }
  }
})
