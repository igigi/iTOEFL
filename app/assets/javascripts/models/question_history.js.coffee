# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.QuestionHistory = DS.Model.extend
  user: DS.belongsTo 'MyTOEFL.User'
  question: DS.belongsTo 'MyTOEFL.Question'
  isCorrect: DS.attr 'boolean'
  answer: DS.attr 'string'
