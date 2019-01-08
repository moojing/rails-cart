function imageUpload(files){
    let formData = new FormData();
    formData.append('upload', files[0]);
      return $.ajax({
              type: "POST", 
              url: '/upload',
              data:formData,
              beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
              cache       : false,
              contentType : false,
              processData : false,
        
            });
  }


  function imageDelete(image_id){
    console.log('image_id',image_id)
      return $.ajax({
              type: "DELETE", 
              url: '/upload/delete/'+image_id,
              // data:{image_id}, // The DELETE method requests that the origin server delete the resource identified by the Request-URI. 
              beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
              cache       : false,
              contentType : false,
              processData : false,
            });
  }