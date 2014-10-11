# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.Opinion = DS.Model.extend
  content: DS.attr 'string'
  mediaUrl: DS.attr 'string'
  seat: DS.attr 'number'
  discussion: DS.belongsTo 'MyTOEFL.Discussion'
  user: DS.belongsTo 'MyTOEFL.User'
