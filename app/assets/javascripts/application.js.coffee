#= require jquery
#= require mozdevs/polyfill

$ ->
  window.audioCtx = new window.AudioContext()

  navigator.mediaDevices
    .getUserMedia(audio: true)
    .then (stream) ->

      input       = audioCtx.createMediaStreamSource(stream)
      window.delayPedal  = audioCtx.createDelay(30)
      input.connect(delayPedal)

      delayPedal.delayTime.value = 0
      delayPedal.connect(audioCtx.destination)

      setInterval ->
        console?.log audioCtx.state + ': ' + delayPedal.delayTime.value.toFixed(2)
      , 1000


  $('#js_mute').on 'click', ->
    if audioCtx.state == 'running'
      $(this).text('Unmute')
      audioCtx.suspend()
    else if audioCtx.state == 'suspended'
      $(this).text('Mute')
      audioCtx.resume()

  $('#js_range').on 'change', ->
    x = $(this).val()
    delayPedal.delayTime.value = x

    info = if x < 0.1
      'Realtime'
    else
      x + ' second delay'

    $('#js_delay').text info
