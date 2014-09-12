# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.LbComment = DS.Model.extend
  content: DS.attr 'string'
  user: DS.belongsTo 'MyTOEFL.User'
  liveBroadcast: DS.belongsTo 'MyTOEFL.LiveBroadcast'
