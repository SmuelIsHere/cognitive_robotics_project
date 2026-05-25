
"use strict";

let StartAwareness = require('./StartAwareness.js')
let WakeUp = require('./WakeUp.js')
let Text2Speech = require('./Text2Speech.js')
let VoiceDetectionService = require('./VoiceDetectionService.js')
let Rest = require('./Rest.js')
let StopAwareness = require('./StopAwareness.js')

module.exports = {
  StartAwareness: StartAwareness,
  WakeUp: WakeUp,
  Text2Speech: Text2Speech,
  VoiceDetectionService: VoiceDetectionService,
  Rest: Rest,
  StopAwareness: StopAwareness,
};
