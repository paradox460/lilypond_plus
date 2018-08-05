module LilypondPlus::BaseRegexps
  NOTE_VALUES = /
    [a-gr] | # Majority of european note names
    do | rey | mi | fa | so | la | si # Catalan, Spanish, Italian, French, etc
  /x
  ACCIDENTALS = /sharp|flat|(?:is+)+|(?:es+)+|[dsbxfk]+/x
  ACCIDENTAL_HINT = /[!?]/
  OCTAVE = /[,']/
  OCTAVE_CHECK = /\=[,']+/
  DURATION = /\d+\.?/

  PITCH = /
    #{NOTE_VALUES}
    #{ACCIDENTALS}?
    #{OCTAVE}?
    #{ACCIDENTAL_HINT}?
    #{OCTAVE_CHECK}?
  /x

  NOTE = /#{PITCH}#{DURATION}/
end
