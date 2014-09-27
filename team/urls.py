from django.conf.urls import patterns, include, url

urlpatterns = patterns('team.views',
    url(r'^team/$', 'getTeamInformation', {'templateName' : 'signUpSuccess.html'}),
    url(r'^sign/$', 'createTeam', {'templateName' : 'signUp.html'}),
    )
