#= require jquery

$ ->

  audioCtx = new (window.AudioContext || window.webkitAudioContext)()

  navigator.mediaDevices
    .getUserMedia(audio: true)
    .then (stream) ->

      input       = audioCtx.createMediaStreamSource(stream)
      delayPedal  = audioCtx.createDelay(30)
      input.connect(delayPedal)

      delayPedal.delayTime.value = 3
      delayPedal.connect(audioCtx.destination)
