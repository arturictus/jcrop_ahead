start_jcrop = ->
  new AvatarCropper()

class AvatarCropper
  constructor: ->
    $('#crop_image').Jcrop
      aspectRatio: 2.2/1
      setSelect: [0, 0, 220, 100]
      allowResize: true
      minSize: [220, 100]
      onSelect: @update
      onChange: @update
  
  update: (coords) =>
    $('#attchament_crop_x').val(coords.x)
    $('#attchament_crop_y').val(coords.y)
    $('#attchament_crop_w').val(coords.w)
    $('#attchament_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
          $('#preview').css
                  width: Math.round(100/coords.w * $('#crop_image').width()) + 'px'
                  height: Math.round(100/coords.h * $('#crop_image').height()) + 'px'
                  marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
                  marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'

$(document).ready start_jcrop
$(document).on "page_load", start_jcrop
