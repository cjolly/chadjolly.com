#= require jquery
#= require mozdevs/polyfill

# TODO:
# user-declined audio error
# $5/month, rather than 24 hours.
# help page
# better control toggling
# CTA on slider click pre-purchase
# actually expire passes...
# save state - so on reload/accidental navigate is saves last setting
# JS error reporting
# Rails 5
# lograge
# scripts to rule them all
# Some friggin tests
# CircleCI

$ ->
  unless window.AudioContext
    $('#app').hide()
    $('#browser_not_supported').show()
    $.ajax
      url: '/errors?ua=' + encodeURIComponent(navigator.userAgent)

  $('#js_mute').on 'click', ->
    if audioCtx?
      $('#js_delay').show()
      if audioCtx.state == 'running'
        $(this).text('Start')
        $('#js_range').prop('disabled', true)
        audioCtx.suspend()
      else if audioCtx.state == 'suspended'
        $(this).text('Stop')
        $('#js_range').prop('disabled', false)
        audioCtx.resume()
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
