// $(document).ready(function() {
//
//   $('#add').on('click', function() {
//     $('#icons').empty();
//     $('.menupull').removeClass('closed');
//     $('.menupull').addClass('open');
//     $('#title').text('Add New Activity');
//     $('.svg-icons').each(function(index) {
//       if (index === 0 || index === 1) {
//         return true;
//       }
//       $('#icons').append($(this).clone());
//     });
//     $('#icons > .svg-icons').on('click', function() {
//       $('#form').empty();
//       modelName = this.id;
//       var params = {model: modelName + ".new"};
//       $.ajax({
//         url: '/activities/getFormInfo',
//         type: 'get',
//         data: params
//       }).success(function(data) {
//         $.each(data, function(attr, type) {
//           if (type === "string" && attr != "description") {
//             $('#form').append('<form id="' + attr +'">' + attr +':<br><input type="text"><br></form>');
//           } else if (attr === "lat" || attr === "long") {
//             $('#form').append('<form id="' + attr +'"> Click on map to set ' + attr +':<br><input type="number"><br></form>');
//           } else if (type === "integer" || type === "float") {
//             $('#form').append('<form id="' + attr +'">' + attr +':<br><input type="number"><br></form>');
//           }  else if (attr == "description") {
//             $('#form').append('<form id="' + attr + '">' + attr +':<br><textarea rows="4" cols="50"></textarea></form>');
//           }
//         });
//         $('#form').append('<input type="submit" id="submit" value="Submit"><br><br><br><br><br>');
//         submitListener(modelName);
//       })
//     });
//   });
//
//   function submitListener(modelName) {
//     $('#submit').on('click', function() {
//       var params = {model: modelName};
//       $('input').each(function(index, info) {
//         params[$(info).parent()[0].id] = $(info).val();
//       });
//       params[$('textarea').parent()[0].id] = $('textarea').val();
//       delete params['form'];
//       submit(params);
//     });
//   }
//
//   function submit(params) {
//     $.ajax({
//       url: '/activities/newActivity',
//       type: 'post',
//       data: params
//     }).success(function(data) {
//       if (data["success"] === true) {
//         window.location.reload();
//       } else {
//         $('#form').prepend('<div id="error" style="font-size: 150%;background: #DDDDDD;color: red;width: 100%;height: 5%;">Error: All information must be filled out.</div><br>')
//       }
//     });
//   }
// });
