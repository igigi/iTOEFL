# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.Question = DS.Model.extend
  content: DS.attr 'string'
  tip: DS.attr 'string'
  relatedResource: DS.attr 'string'
  set: DS.attr 'number'
  number: DS.attr 'number'
  subject: DS.attr 'string'
  source: DS.attr 'string'
  difficulty: DS.attr 'string'
