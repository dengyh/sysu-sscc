from django.conf.urls import patterns, include, url

urlpatterns = patterns('sysuer.views',
    url(r'^login/$', 'loginView', {'templateName' : 'login.html'}),
    url(r'^logout/$', 'logoutView', {'templateName' : 'logout.html'}),
    )
