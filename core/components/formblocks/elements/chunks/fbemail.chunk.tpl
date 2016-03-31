[[%formblocks.email.introtext]]<br><br>

[[!fbFormReport? &id=`[[*id]]`]]
[[-!fbSimplxWidgeteer?
    &dataSet=`[[!fbEmailGetJSON? &formID=`[[*id]]`]]`
    &useChunkMatching=`true`
    &chunkMatchRoot=`true`
    &chunkPrefix=`fbEmailRow_`
    &chunkMatchingSelector=`field`
]]
