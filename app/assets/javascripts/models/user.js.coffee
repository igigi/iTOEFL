# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.User = DS.Model.extend
  origin: DS.attr 'string'
  openId: DS.attr 'string'
  password: DS.attr 'string'
  authToken: DS.attr 'string'
  nickname: DS.attr 'string'
