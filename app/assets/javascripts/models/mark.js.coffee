# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.Mark = DS.Model.extend
  content: DS.attr 'string'
  questionHistory: DS.belongsTo 'MyTOEFL.QuestionHistory'
  user: DS.belongsTo 'MyTOEFL.User'
