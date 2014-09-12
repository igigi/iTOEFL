# for more details see: http://emberjs.com/guides/models/defining-models/

MyTOEFL.LiveBroadcast = DS.Model.extend
  title: DS.attr 'string'
  cover: DS.attr 'string'
  summary: DS.attr 'string'
  videoUrl: DS.attr 'string'
  startAt: DS.attr 'date'
