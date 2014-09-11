# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.RbComment = DS.Model.extend
  content: DS.attr 'string'
  user: DS.belongsTo 'MyTOEFL.User'
  recordedBroadcast: DS.belongsTo 'MyTOEFL.RecordedBroadcast'
