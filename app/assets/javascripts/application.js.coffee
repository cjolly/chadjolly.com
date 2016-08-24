#= require jquery

$ ->
  console.log("we be jammin!")

  window.audioCtx = new (window.AudioContext || window.webkitAudioContext)()

  gainNode = audioCtx.createGain()

  # oscillator.connect(gainNode)
  # gainNode.connect(audioCtx.destination)
  #
  # oscillator.type = 'sine' # sine wave — other values are 'square', 'sawtooth', 'triangle' and 'custom'
  # oscillator.frequency.value = 440; # value in hertz
  #
  # # oscillator.start();

  navigator.mediaDevices
    .getUserMedia(audio: true)
    .then (stream) ->

      input  = audioCtx.createMediaStreamSource(stream)
      delay  = audioCtx.createDelay(5.0)
      input.connect(delay)

      delay.delayTime.value = 3
      delay.connect(audioCtx.destination)

      setTimeout ->
        delay.delayTime.value = 0
        console.log "should be 0!"
      , 6000
