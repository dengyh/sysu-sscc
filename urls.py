from django.conf.urls import patterns, include, url
import settings
import xadmin

xadmin.autodiscover()

urlpatterns = patterns('',
    url(r'', include('base.urls')),
    url(r'', include('sysuer.urls')),
    url(r'^team/', include('team.urls')),
    url(r'^section/', include('section.urls')),
    url(r'^xadmin/', include(xadmin.site.urls)),
    url(r'^(?P<path>.*)$', 'django.views.static.serve', {
        'document_root' : settings.PROJECT_PATH
        }),
)
