$ ->
  $('#lead_image').click ->
    $('#news_image_field').show()
    $('#news_video_fields').hide()
  $('#lead_video').click ->
    $('#news_image_field').hide()
    $('#news_video_fields').show()
