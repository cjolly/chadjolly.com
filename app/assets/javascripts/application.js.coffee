#= require jquery
#= require mozdevs/polyfill

# TODO:
# better help content
# store pass-id, redirect to URL if present.
# seconds_of_use setInterval updates
# scripts to rule them all
# Some friggin tests
# CircleCI
# Free pass URL - create 1 day toke
# Standardize id/class for JS
# save state - so on reload/accidental navigate is saves last setting
# actually expire passes... we've got a month from first purchase, hah.

ensureBrowserSupport = ->
  unless window.AudioContext?
    $('#app').hide()
    $('#browser_not_supported').show()
    $.ajax
      url: '/errors?ua=' + encodeURIComponent(navigator.userAgent)

$ ->
  ensureBrowserSupport()

  $('#js_slider_container').on 'click', ->
    unless $('#checkout').data('pass-id')
      alert "All I ask is a beer and the slider is yours!"

  $('#js_mute').on 'click', ->
    if audioCtx?
      $('#js_delay').show()
      if audioCtx.state == 'running'
        $(this).text('Start')
        audioCtx.suspend()
        if $('#checkout').data('pass-id')
          $('#js_range').prop('disabled', true)
      else if audioCtx.state == 'suspended'
        $(this).text('Stop')
        audioCtx.resume()
        if $('#checkout').data('pass-id')
          $('#js_range').prop('disabled', false)

    else
      window.audioCtx = new window.AudioContext()
      window.usage = 0

      navigator.mediaDevices
        .getUserMedia(audio: true)
        .then (stream) ->

          input = audioCtx.createMediaStreamSource(stream)
          window.delayPedal = audioCtx.createDelay(parseInt $('#js_range').attr('max'))
          input.connect(delayPedal)

          delayPedal.delayTime.value = 0
          delayPedal.connect(audioCtx.destination)

          $('#js_delay').show()
          $('#js_mute').text('Stop')
          if $('#checkout').data('pass-id')?
            $('#js_range').prop('disabled', false)

          setInterval ->
            usage++ if audioCtx.state == 'running'
            console?.log audioCtx.state + ': ' + delayPedal.delayTime.value.toFixed(2) + ', total: ' + usage
          , 1000
        .catch (error) ->
          $('#ensure').hide()
          $('#ensure_error').show()
          $('.controls').hide()
          $.ajax
            url: '/errors?denied=' + encodeURIComponent(error.name)


      $('#js_range').on 'change', ->
        x = $(this).val()
        delayPedal.delayTime.value = x

        info = if x < 0.1
          'Realtime'
        else
          x + ' second delay'

        $('#js_delay').text info

  if date_in_utc = $('#pass_valid_until').data('date')
    date = new Date date_in_utc
    $('#pass_valid_until').html(date.toLocaleString())
