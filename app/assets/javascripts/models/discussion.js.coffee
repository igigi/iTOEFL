# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.Discussion = DS.Model.extend
  content: DS.attr 'string'
  mediaUrl: DS.attr 'string'
  user: DS.belongsTo 'MyTOEFL.User'
