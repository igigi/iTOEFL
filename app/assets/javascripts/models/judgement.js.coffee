# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.Judgement = DS.Model.extend
  score: DS.attr 'number'
  mark: DS.belongsTo 'MyTOEFL.Mark'
  user: DS.belongsTo 'MyTOEFL.User'
