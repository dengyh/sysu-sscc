from django.conf.urls import patterns, include, url

urlpatterns = patterns('team.views',
    url(r'^$', 'getTeamInformation', {'templateName' : 'team.html'}),
    url(r'^create/$', 'createTeam', {'templateName' : 'createTeam.html'}),
    )
