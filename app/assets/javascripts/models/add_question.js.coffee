# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.AddQuestion = DS.Model.extend
  content: DS.attr 'string'
  mark: DS.belongsTo 'MyTOEFL.Mark'
  user: DS.belongsTo 'MyTOEFL.User'
