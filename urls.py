from django.conf.urls import patterns, include, url
import settings
import xadmin

xadmin.autodiscover()

urlpatterns = patterns('',
    url(r'^xadmin/', include(xadmin.site.urls)),
    url(r'^(?P<path>.*)$', 'django.views.static.serve', {
        'document_root' : settings.PROJECT_PATH
        }),
)
