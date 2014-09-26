from django.conf.urls import patterns, include, url

urlpatterns = patterns('section.views',
    url(r'^(\d+)/$', 'getSectionDetail', {'templateName' : 'section.html'}),
    )
