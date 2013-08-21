$ ->
  
  $('.header .nav a').each ->
    $link = $(this)
    $link.parent().removeClass 'selected'
    if $link.attr('href') == window.location.pathname.toLowerCase()
      $link.parent().addClass 'selected'
